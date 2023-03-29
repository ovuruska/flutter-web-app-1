

import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_event.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';

import '../../../features/app_calendar/presentation/bloc/app_calendar_bloc.dart';
import '../../../features/app_calendar/presentation/bloc/app_calendar_event.dart';
import '../../../features/app_multi_calendar/presentation/bloc/app_multi_calendar_bloc.dart';
import '../../../features/appointment_schedule/domain/callbacks/appointment_header_set_date.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import '../../../injection.dart';

class AppointmentHeaderSetDateCallbackImpl extends AppointmentHeaderSetDateCallback {
  @override
  void call(DateTime date) {
    sl<AppCalendarBloc>().add(
      AppCalendarSetDateEvent(date),
    );
    sl<AppMultiCalendarBloc>().add(
      AppMultiCalendarEventSetDate(date: date),
    );
    var branch = sl<AppSelectBranchBloc>().getBranch();

    if(branch != null){
      sl<AppointmentScheduleBloc>().add(
        AppointmentScheduleEventGetAppointments(date:date,branch: branch.id),
      );
    }

  }


}