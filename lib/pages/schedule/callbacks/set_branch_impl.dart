

import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/appointment_schedule/appointment_schedule_bloc.dart';

import '../../../features/app_select_branch/domain/callbacks/set_branch_callback.dart';
import '../../../features/app_select_branch/domain/entities/branch_id_and_name.dart';
import '../../../features/appointment_schedule/presentation/bloc/appointment_schedule/appointment_schedule_event.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_event.dart';
import '../../../injection.dart';

class ScheduleSetBranchCallbackImpl extends AppSelectBranchSetBranchCallback{
  @override
  void call(BranchIdAndName? branch) {
    var date = sl<AppointmentScheduleHeaderBloc>().state.date;
    sl<AppointmentScheduleBloc>().add(
      AppointmentScheduleGetAppointmentsEvent(date:date,branch:branch?.id),
    );
    sl<AppointmentScheduleHeaderBloc>().add(
      ScheduleHeaderSetBranchEvent(branch:branch?.id),
    );
  }
}