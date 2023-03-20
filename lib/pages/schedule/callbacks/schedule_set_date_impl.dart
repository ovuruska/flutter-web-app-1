


import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/appointment_schedule.dart';

import '../../../features/app_calendar/presentation/bloc/app_calendar_bloc.dart';
import '../../../features/app_calendar/presentation/bloc/app_calendar_event.dart';
import '../../../features/appointment_schedule/domain/callbacks/appointment_header_set_date.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';
import '../../../injection.dart';

class AppointmentHeaderSetDateCallbackImpl extends AppointmentHeaderSetDateCallback {
  @override
  void call(DateTime date) {
    sl<AppCalendarBloc>().add(
      AppCalendarSetDateEvent(date),
    );
    var branch = sl<AppointmentScheduleHeaderBloc>().state.branch;
    // TODO: Implement employee schedule get appointments.

    if(branch != null){
      sl<AppointmentScheduleBloc>().add(
        AppointmentScheduleGetAppointmentsEvent(date:date,branch: branch),
      );
    }

  }


}