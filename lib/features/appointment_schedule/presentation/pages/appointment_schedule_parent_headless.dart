import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_state.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_state.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/constants.dart';

import '../../../../injection.dart';
import '../bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../bloc/branch_schedule/appointment_schedule_state.dart';
import '../bloc/schedule_header_dropdown/schedule_header_dropdown_bloc.dart';
import '../bloc/schedule_header_dropdown/schedule_header_dropdown_state.dart';
import 'appointment_schedule_headless.dart';
import 'employee_schedule.dart';

class AppointmentScheduleParentHeadlessView extends StatelessWidget {
  // Provide branch id and date

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppMultiCalendarBloc, AppMultiCalendarState>(
        bloc: sl<AppMultiCalendarBloc>(),
    builder: (context, calendarState) =>
    BlocBuilder<AppSelectBranchBloc, AppSelectBranchState>(
    bloc: sl<AppSelectBranchBloc>(),
        builder:(context,branchState) => BlocBuilder<
            ScheduleHeaderDropdownBloc, ScheduleHeaderDropdownState>(
            bloc: sl<ScheduleHeaderDropdownBloc>(),
            builder: (context, state) {
              var value = state.value;
              var branch = sl<AppSelectBranchBloc>().getBranch();

              var date = calendarState.date;
              if (value == 'All Employees') {
                return AppointmentScheduleHeadlessView(
                  branch: branch?.id,
                  date: date,
                );
              } else if (nonEmployeeTabs.contains(value)) {
                return AppointmentScheduleHeadlessView(
                  branch: branch?.id,
                  date: date,
                  role: value,
                );
              } else {
                var allEmployees = (sl<AppointmentScheduleBloc>().state as AppointmentScheduleStateLoaded).employees;
                var employee =
                allEmployees.firstWhere((element) => element.name == value);
                return EmployeeScheduleView(key:Key(value), employee: employee);
              }
            })));
  }
}
