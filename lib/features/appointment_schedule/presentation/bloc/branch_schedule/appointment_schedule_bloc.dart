import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/usecases/get_appointments.dart';

import '../../../../../widgets/cards/root/entity.dart';
import '../../../domain/usecases/get_branch_employees.dart';
import '../../../domain/usecases/patch_appointment.dart';
import 'appointment_schedule_event.dart';
import 'appointment_schedule_state.dart';

const allowed = <String>[
  "Confirmed",
  "Pending",
  "CheckedIn",
  "PickUpReady",
  "Completed",
  "Cancelled"
];

class AppointmentScheduleBloc
    extends Bloc<AppointmentScheduleEvent, AppointmentScheduleState> {
  final PatchAppointmentUseCase patchAppointment;
  final GetAppointmentsUseCase getAppointments;
  final GetBranchEmployeesUseCase getEmployees;

  AppointmentScheduleBloc(
      {required this.getAppointments,
      required this.getEmployees,
      required this.patchAppointment})
      : super(AppointmentScheduleStateInitial()) {
    on<AppointmentScheduleInitializeEvent>((event, emit) {
      emit(AppointmentScheduleStateInitial());
    });

    on<AppointmentSchedulePatchEvent>((event, emit) async {
      var appointment = event.appointment;
      var params = PatchAppointmentParams(appointment);
      patchAppointment(params);

      var currentAppointments = (state as AppointmentScheduleStateLoaded).appointments;
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
    on<AppointmentScheduleGetEmployeesEvent>((event, emit) async {});
    on<AppointmentScheduleGetAppointmentsEvent>((event, emit) async {
      List<DashboardEmployeeEntity> employees = [];
      if (state == AppointmentScheduleStateLoaded) {
        employees = (state as AppointmentScheduleStateLoaded).employees;
      }
      var date = event.date;
      var branch = event.branch;

      if (branch == null) {
        emit(AppointmentScheduleStateInitial());
      } else {
        var params = GetAppointmentsParams(date: date, branch: branch);
        var result = await getAppointments(params);

        result.fold((l) {}, (r) {
          employees = mergeEmployees(employees, getAppointmentEmployees(r));
          emit(AppointmentScheduleStateLoaded(
              employees: employees, appointments: filterAppointments(r)));
        });
      }
    });

    on<AppointmentSchedulePatchLocalEvent>((event, emit) async {
      var appointment = event.appointment;
      var currentAppointments = (state as AppointmentScheduleStateLoaded).appointments;
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
  }

  List<DashboardAppointmentEntity> filterAppointments(
      List<DashboardAppointmentEntity> appointments) {
    return appointments
        .where((e) =>
            allowed.contains(e.status) &&
            e.start.add(Duration(minutes: 15)).isBefore(e.end) &&
            e.start.hour >= 8 &&
            e.end.hour <= 20)
        .toList();
  }

  List<DashboardEmployeeEntity> getAppointmentEmployees(
      List<DashboardAppointmentEntity> appointments) {
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
