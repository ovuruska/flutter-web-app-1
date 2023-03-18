import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/constants.dart';

import '../../../../injection.dart';
import '../bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../bloc/branch_schedule/appointment_schedule_state.dart';
import '../bloc/schedule_header/schedule_header_bloc.dart';
import '../bloc/schedule_header/schedule_header_state.dart';
import '../bloc/schedule_header_dropdown/schedule_header_dropdown_bloc.dart';
import '../bloc/schedule_header_dropdown/schedule_header_dropdown_state.dart';
import 'appointment_schedule.dart';
import 'employee_schedule.dart';

class AppointmentScheduleParentView extends StatelessWidget {
  // Provide branch id and date

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentScheduleHeaderBloc, ScheduleHeaderState>(
        bloc: sl<AppointmentScheduleHeaderBloc>(),
        builder: (context, headerState) => BlocBuilder<
                ScheduleHeaderDropdownBloc, ScheduleHeaderDropdownState>(
            bloc: sl<ScheduleHeaderDropdownBloc>(),
            builder: (context, state) {
              var value = state.value;
              var branch = headerState.branch;
              var date = headerState.date;
              if (value == 'All Employees') {
                return AppointmentScheduleView(
                  branch: branch,
                  date: date,
                );
              } else if (nonEmployeeTabs.contains(value)) {
                return AppointmentScheduleView(
                  branch: branch,
                  date: date,
                  role: value,
                );
              } else {
                var allEmployees = (sl<AppointmentScheduleBloc>().state as AppointmentScheduleStateLoaded).employees;
                var employee =
                    allEmployees.firstWhere((element) => element.name == value);
                return EmployeeScheduleView(date:date, employee: employee);
              }
            }));
  }
}
