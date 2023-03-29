import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_branch_daily_information.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/usecases/get_appointments.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../domain/usecases/get_branch_employees.dart';
import '../../../domain/usecases/on_drag_create_appointment.dart';
import '../../../domain/usecases/patch_appointment.dart';
import '../../../utils/convert.dart';
import 'appointment_schedule_event.dart';
import 'appointment_schedule_state.dart';

const allowed = <String>[
  "Confirmed",
  "Pending",
  "CheckedIn",
  "PickUpReady",
  "Completed",
  "Cancelled",
  "NoShow",
  "NoShowUnpaid"
];

class AppointmentScheduleBloc
    extends Bloc<AppointmentScheduleEvent, AppointmentScheduleState> {
  final PatchAppointmentUseCase patchAppointment;
  final GetAppointmentsUseCase getAppointments;
  final GetBranchEmployeesUseCase getEmployees;
  final OnDragCreateAppointmentUseCase createAppointment;
  final GetBranchDailyInformationUseCase getBranchDailyInformation;

  AppointmentScheduleBloc(
      {required this.getAppointments,
      required this.createAppointment,
      required this.getEmployees,
      required this.getBranchDailyInformation,
      required this.patchAppointment})
      : super(AppointmentScheduleStateInitial()) {
    on<AppointmentScheduleEventInitialize>((event, emit) {
      emit(AppointmentScheduleStateInitial());
    });

    on<AppointmentScheduleEventGoTo>((event, emit) async {
      var id = event.id;
      var date = event.date;
      add(
        AppointmentScheduleEventGetAppointments(
          date: date,
          branch: id,
        ),
      );
    });

    on<AppointmentScheduleEventPatch>((event, emit) async {
      var appointment = event.appointment;
      var params = PatchAppointmentParams(appointment);
      patchAppointment(params);

      var currentAppointments =
          (state as AppointmentScheduleStateLoaded).appointments;
      bool found = false;

      currentAppointments = currentAppointments.map((e) {
        if (e.id == appointment.id) {
          found = true;
          return appointment;
        }
        return e;
      }).toList();
      if (!found) {
        currentAppointments.add(appointment);
      }
      emit(AppointmentScheduleStateLoaded(
          employees: (state as AppointmentScheduleStateLoaded).employees,
          appointments: currentAppointments));
    });
    on<AppointmentScheduleEventGetEmployees>((event, emit) async {
      add(AppointmentScheduleEventGetAppointments(
          date: event.date, branch: event.branch));
    });
    on<AppointmentScheduleEventGetAppointments>((event, emit) async {
      List<DashboardEmployeeEntity> employees = [];
      if (state == AppointmentScheduleStateLoaded) {
        employees = (state as AppointmentScheduleStateLoaded).employees;
      }
      var date = event.date;
      var branch = event.branch;

      if (branch == null) {
        emit(AppointmentScheduleStateInitial());
      } else {
        var params = GetBranchDailyInformationParams(date: date, id: branch);
        var result = await getBranchDailyInformation(params);
        if (result != null) {
          var schedulingAppointments = result.appointments
              .map((appt) => convertFromAppointmentEntity(appt))
              .toList();
          var dashboardEmployees = result.employees.map((e) {
            var employee = DashboardEmployeeEntity(
                id: e.id,
                name: e.name,
                role: e.role,
            );
            return employee;
          }).toList();
          emit(AppointmentScheduleStateLoaded(
              employees: dashboardEmployees,
              appointments: filterAppointments(schedulingAppointments)));
        }
      }
    });

    on<AppointmentScheduleEventPatchLocal>((event, emit) async {
      var appointment = event.appointment;
      var currentAppointments =
          (state as AppointmentScheduleStateLoaded).appointments;
      bool found = false;

      currentAppointments = currentAppointments.map((e) {
        if (e.id == appointment.id) {
          found = true;
          return appointment;
        }
        return e;
      }).toList();
      if (!found) {
        currentAppointments.add(appointment);
      }
      emit(AppointmentScheduleStateLoaded(
          employees: (state as AppointmentScheduleStateLoaded).employees,
          appointments: currentAppointments));
    });

    on<AppointmentScheduleEventCreate>((event, emit) async {
      var appointment = event.appointment;
      var params = OnDragCreateAppointmentParams(appointment: appointment);
      var result = await createAppointment(params);
      var appointmentEntity = result.fold((l) => null, (r) => r);
      if (appointmentEntity != null) {
        var createdAppointment =
            convertFromAppointmentEntity(appointmentEntity);
        var currentAppointments =
            (state as AppointmentScheduleStateLoaded).appointments +
                [createdAppointment];
        emit(AppointmentScheduleStateLoaded(
            employees: (state as AppointmentScheduleStateLoaded).employees,
            appointments: currentAppointments));
      }
    });
  }

  List<SchedulingAppointmentEntity> filterAppointments(
      List<SchedulingAppointmentEntity> appointments) {
    return appointments
        .where((e) =>
            allowed.contains(e.status) &&
            e.start.add(Duration(minutes: 15)).isBefore(e.end) &&
            e.start.hour >= 8 &&
            e.end.hour <= 20)
        .toList();
  }

  List<DashboardEmployeeEntity> getAppointmentEmployees(
      List<SchedulingAppointmentEntity> appointments) {
    List<DashboardEmployeeEntity> result = [];
    List<int> ids = [];
    for (var appointment in appointments) {
      var employee = DashboardEmployeeEntity(
          id: appointment.employee,
          name: appointment.employeeName,
          role: appointment.service);
      if (!ids.contains(employee.id)) {
        ids.add(employee.id);
        result.add(employee);
      }
    }
    return result;
  }

  List<DashboardEmployeeEntity> mergeEmployees(
      List<DashboardEmployeeEntity> a, List<DashboardEmployeeEntity> b) {
    List<DashboardEmployeeEntity> result = b;
    var ids = b.map((e) => e.id).toList();
    for (var employee in a) {
      if (!ids.contains(employee.id)) {
        result.add(employee);
      }
    }
    return result;
  }
}
