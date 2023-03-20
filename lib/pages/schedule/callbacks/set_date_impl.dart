import '../../../features/app_calendar/domain/callbacks/calendar_set_date.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_event.dart';
import '../../../injection.dart';

class ScheduleSetDateCallbackImpl extends AppCalendarSetDateCallback{
  @override
  void call(DateTime date) {
    var branch = sl<AppointmentScheduleHeaderBloc>().state.branch;
    // TODO: Implement employee schedule get appointments.


    sl<AppointmentScheduleBloc>().add(
      AppointmentScheduleGetAppointmentsEvent(date:date,branch:branch ?? -1),
    );
    sl<AppointmentScheduleHeaderBloc>().add(
      AppointmentScheduleHeaderEventSetDate(date:date),
    );
  }
}