import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/convert.dart';

import '../../../../../core/domain/usecases/create_appointment.dart';
import '../../../domain/usecases/get_employee_appointments.dart';
import '../../../domain/usecases/on_drag_create_appointment.dart';
import '../../../domain/usecases/patch_appointment.dart';
import 'employee_schedule_state.dart';

class EmployeeScheduleBloc
    extends Bloc<EmployeeScheduleEvent, EmployeeScheduleState> {
  final GetEmployeeAppointmentsUseCase getAppointments;
  final PatchAppointmentUseCase patchAppointment;
  final OnDragCreateAppointmentUseCase createAppointment;

  EmployeeScheduleBloc(
      {required this.getAppointments, required this.patchAppointment, required this.createAppointment})
      : super(EmployeeScheduleInitial()) {
    on<EmployeeScheduleEventGoTo>((event,emit) async {

      var id = event.id;
      var start = event.date.startOfWeek();
      var end = event.date.endOfWeek();
      add(
        EmployeeScheduleGetAppointmentsEvent(
          id: id,
          start: start,
          end: end,
        ),
      );
    });
    on<EmployeeScheduleGetAppointmentsEvent>((event, emit) async {
      emit(EmployeeScheduleLoading());
      var params = GetEmployeeAppointmentsParams(
        id: event.id,
        start: event.start,
        end: event.end,
      );

      var results = await getAppointments(params);
      results.fold((l) => emit(EmployeeScheduleInitial()),
          (r) => emit(EmployeeScheduleLoaded(id: event.id, appointments: r as List<SchedulingAppointmentEntity>)));
    });

    on<EmployeeSchedulePatchEvent>((event, emit) async {
      var appointment = event.appointment;
      var employeeId = appointment.employee;
      var params = PatchAppointmentParams(appointment);

      patchAppointment(params);

      var currentAppointments = (state as EmployeeScheduleLoaded).appointments;
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
      emit(EmployeeScheduleLoaded(id:employeeId,appointments: currentAppointments));
    });
    on<EmployeeScheduleEventCreate>((event,emit)async{
      var appointment = event.appointment;
      var employeeId = appointment.employee;

      var params = OnDragCreateAppointmentParams(appointment:appointment);
      var result = await createAppointment(params);
      var appointmentEntity = result.fold((l) => null, (r) => r);
      if(appointmentEntity != null) {
        var currentAppointments =
            (state as EmployeeScheduleLoaded).appointments;
        var createdAppointment = convertFromAppointmentEntity(appointmentEntity);
        currentAppointments.add(createdAppointment);
        emit(EmployeeScheduleLoaded(
            id:employeeId,
            appointments: currentAppointments));
      }
    });
  }
}
