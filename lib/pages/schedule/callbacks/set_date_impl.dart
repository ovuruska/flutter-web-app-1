

import 'package:scrubbers_employee_application/features/app_calendar/presentation/bloc/app_calendar_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/appointment_schedule/appointment_schedule_bloc.dart';

import '../../../features/app_calendar/domain/callbacks/calendar_set_date.dart';
import '../../../features/app_select_branch/domain/callbacks/set_branch_callback.dart';
import '../../../features/app_select_branch/domain/entities/branch_id_and_name.dart';
import '../../../features/appointment_schedule/presentation/bloc/appointment_schedule/appointment_schedule_event.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';
import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_event.dart';
import '../../../injection.dart';

class ScheduleSetDateCallbackImpl extends AppCalendarSetDateCallback{
  @override
  void call(DateTime date) {
    var branch = sl<AppointmentScheduleHeaderBloc>().state.branch;
    sl<AppointmentScheduleBloc>().add(
      AppointmentScheduleGetAppointmentsEvent(date:date,branch:branch ?? -1),
    );
    sl<AppointmentScheduleHeaderBloc>().add(
      ScheduleHeaderSetDateEvent(date:date),
    );
  }
}