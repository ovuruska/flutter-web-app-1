import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';

import '../../domain/usecases/get_appointments.dart';
import '../../domain/usecases/patch_appointment.dart';
import 'daily_column_event.dart';
import 'daily_column_state.dart';

class DailyColumnBloc extends Bloc<DailyColumnEvent, DailyColumnState> {
  DailyColumnGetAppointmentsUseCase getAppointments;
  DailyColumnPatchAppointmentUseCase patchAppointment;

  DailyColumnBloc({
    required this.getAppointments,
    required this.patchAppointment,
  }) : super(DailyColumnInitial()) {
    on<DailyColumnEventSetTarget>((event, emit) async {
      emit(DailyColumnLoading());
      var employeeId = event.employee;
      var date = event.date;
      var employeeName = event.employeeName;
      var target = event.target;

      var response = await getAppointments(DailyColumnGetAppointmentsParams(
        employee: employeeId,
        date: date,
      ));

      List<SchedulingAppointmentEntity> appointments =
          response.fold((l) => [], (r) => r);
      var state = DailyColumnLoaded(
        date: date,
        employeeName: employeeName,
        appointments: appointments,
        employee: employeeId,
        target: target,
      );
      emit(state);
    });
    on<DailyColumnEventPatchAppointment>((event, emit) {
      var appointment = event.appointment;
      patchAppointment(DailyColumnPatchAppointmentParams(
        appointment: appointment,
      ));
      var oldState = (state as DailyColumnLoaded);
      var oldAppointments = oldState.appointments;
      var newAppointments = oldAppointments.map((e) {
        if (e.id == appointment.id) {
          return appointment;
        } else {
          return e;
        }
      }).toList();

      var newState = DailyColumnLoaded(
        date: oldState.date,
        employeeName: oldState.employeeName,
        appointments: newAppointments,
        employee: oldState.employee,
        target: oldState.target,
      );
      emit(newState);

    });

    on<DailyColumnEventPatchLocalAppointment>(
        (event, emit) {
          var appointment = event.appointment;
          var oldState = (state as DailyColumnLoaded);
          var oldAppointments = oldState.appointments;
          var newAppointments = oldAppointments.map((e) {
            if (e.id == appointment.id) {
              return appointment;
            } else {
              return e;
            }
          }).toList();

          var newState = DailyColumnLoaded(
            date: oldState.date,
            employeeName: oldState.employeeName,
            appointments: newAppointments,
            employee: oldState.employee,
            target: oldState.target,
          );
          emit(newState);
        }
    );
  }


}
