


import '../../../features/app_calendar/presentation/bloc/app_calendar_bloc.dart';
import '../../../features/app_calendar/presentation/bloc/app_calendar_event.dart';
import '../../../features/appointment_schedule/domain/callbacks/appointment_header_set_date.dart';
import '../../../injection.dart';

class AppointmentHeaderSetDateCallbackImpl extends AppointmentHeaderSetDateCallback {
  @override
  void call(DateTime date) {
    sl<AppCalendarBloc>().add(
      AppCalendarSetDateEvent(date),
    );
  }


}