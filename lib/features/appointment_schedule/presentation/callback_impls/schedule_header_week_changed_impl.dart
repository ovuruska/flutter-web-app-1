

import 'package:scrubbers_employee_application/common/DateUtils.dart';

import '../../../../injection.dart';
import '../../domain/callbacks/schedule_header_week_changed.dart';
import '../bloc/employee_schedule/employee_schedule_bloc.dart';
import '../bloc/employee_schedule/employee_schedule_event.dart';
import '../bloc/employee_schedule/employee_schedule_state.dart';

class ScheduleHeaderWeekChangedCallbackImpl implements ScheduleHeaderWeekChangedCallback {
  @override
  void call(DateTime date) {
    var start = date.startOfWeek();
    var end = date.endOfWeek();
    var state = (sl<EmployeeScheduleBloc>().state as EmployeeScheduleLoaded);
    sl<EmployeeScheduleBloc>().add(EmployeeScheduleGetAppointmentsEvent(
        id: state.id, start: start, end: end));
  }
}