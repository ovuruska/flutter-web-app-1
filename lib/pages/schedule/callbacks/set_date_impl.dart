import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';

import '../../../features/app_multi_calendar/domain/callbacks/calendar_set_date.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import '../../../injection.dart';

class ScheduleSetDateCallbackImpl extends AppMultiCalendarSetDateCallback{
  @override
  void call(DateTime date) {

    var branch = sl<AppSelectBranchBloc>().getBranch();
    sl<AppointmentScheduleBloc>().add(
      AppointmentScheduleEventGetAppointments(date:date,branch: branch?.id),
    );
  }
}