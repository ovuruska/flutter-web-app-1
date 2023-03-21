import '../../../features/app_multi_calendar/domain/callbacks/calendar_set_date.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_event.dart';
import '../../../injection.dart';

class ScheduleSetDateCallbackImpl extends AppMultiCalendarSetDateCallback{
  @override
  void call(DateTime date) {

    var branch = sl<AppointmentScheduleHeaderBloc>().state.branch;
    sl<AppointmentScheduleBloc>().add(
      AppointmentScheduleGetAppointmentsEvent(date:date,branch: branch?.id),
    );
    sl<AppointmentScheduleHeaderBloc>().add(
      AppointmentScheduleHeaderEventSetDate(date:date),
    );
  }
}