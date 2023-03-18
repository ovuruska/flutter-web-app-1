import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_event.dart';

import '../../../domain/usecases/get_employee_appointments.dart';
import '../../../domain/usecases/patch_appointment.dart';
import 'employee_schedule_state.dart';

class EmployeeScheduleBloc
    extends Bloc<EmployeeScheduleEvent, EmployeeScheduleState> {
  final GetEmployeeAppointmentsUseCase getAppointments;
  final PatchAppointmentUseCase patchAppointment;

  EmployeeScheduleBloc(
      {required this.getAppointments, required this.patchAppointment})
      : super(EmployeeScheduleInitial()) {
    on<EmployeeScheduleGetAppointmentsEvent>((event, emit) async {
      emit(EmployeeScheduleLoading());
      var params = GetEmployeeAppointmentsParams(
        id: event.id,
        start: event.start,
        end: event.end,
      );

      var results = await getAppointments(params);
      results.fold(
          (l) => emit(EmployeeScheduleInitial()), (r) => emit(EmployeeScheduleLoaded(appointments: r)));
    });

    on<EmployeeSchedulePatchEvent>((event, emit) async {
      var appointment = event.appointment;
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
      emit(EmployeeScheduleLoaded(appointments: currentAppointments));
    });
  }
}
