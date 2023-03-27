


import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/widgets/app_multi_calendar.dart';

import '../../../features/app_select_branch/domain/callbacks/set_branch_callback.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import '../../../injection.dart';

class ScheduleSetBranchCallbackImpl extends AppSelectBranchSetBranchCallback{
  @override
  void call(BranchEntity? branch) {
    var date = sl<AppMultiCalendarBloc>().state.date;
    sl<AppointmentScheduleBloc>().add(
      AppointmentScheduleEventGetAppointments(date:date,branch:branch?.id),
    );
  }
}