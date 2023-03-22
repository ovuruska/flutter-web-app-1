


import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';

import '../../../features/app_select_branch/domain/callbacks/set_branch_callback.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_event.dart';
import '../../../injection.dart';

class ScheduleSetBranchCallbackImpl extends AppSelectBranchSetBranchCallback{
  @override
  void call(BranchEntity? branch) {
    var date = sl<AppointmentScheduleHeaderBloc>().state.date;
    sl<AppointmentScheduleBloc>().add(
      AppointmentScheduleGetAppointmentsEvent(date:date,branch:branch?.id),
    );
    sl<AppointmentScheduleHeaderBloc>().add(
      AppointmentScheduleHeaderEventSetBranch(branch:branch),
    );
  }
}