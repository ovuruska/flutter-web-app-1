

import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_event.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header_dropdown/schedule_header_dropdown_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header_dropdown/schedule_header_dropdown_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/constants.dart';
import 'package:scrubbers_employee_application/injection.dart';

void goTo(SchedulingAppointmentEntity appointment) {
  goToWithDetails(
    branch: appointment.branch,
    employee: appointment.employee,
    date: appointment.start,
  );
}

void goToBranchWithService({
  required int branch,
  required String service,
  required DateTime date,
}) {
  var branchBloc = sl<AppSelectBranchBloc>();
  var calendarBloc = sl<AppMultiCalendarBloc>();

  branchBloc.add(AppSelectBranchEventSetId(id: branch));
  calendarBloc.add(AppMultiCalendarEventSetDate(date: date));
  sl<ScheduleHeaderDropdownBloc>().add(ScheduleHeaderDropdownEventSet(service));
  sl<AppointmentScheduleBloc>().add(AppointmentScheduleEventGoTo(id:branch,date:date));
}

void goToWithDetails({
  required int branch,
  required int employee,
  required DateTime date,
}) {
  var state = sl<ScheduleHeaderDropdownBloc>().state;

  var value = state.value;
  var branchBloc = sl<AppSelectBranchBloc>();
  var calendarBloc = sl<AppMultiCalendarBloc>();

  branchBloc.add(AppSelectBranchEventSetId(id: branch));
  calendarBloc.add(AppMultiCalendarEventSetDate(date: date));
  if (value == 'All Employees') {


    sl<AppointmentScheduleBloc>().add(AppointmentScheduleEventGoTo(id:branch,date:date));

  } else if (nonEmployeeTabs.contains(value)) {
    sl<AppointmentScheduleBloc>().add(AppointmentScheduleEventGoTo(id:branch,date:date));

  } else {
    sl<EmployeeScheduleBloc>().add(EmployeeScheduleEventGoTo(id:employee,date:date));

  }
}