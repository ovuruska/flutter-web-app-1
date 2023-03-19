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
      emit(DailyColumnLoading());
    });
  }
}
