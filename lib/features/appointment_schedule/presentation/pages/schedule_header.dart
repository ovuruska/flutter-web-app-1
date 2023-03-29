import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_state.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_state.dart';

import '../../../../injection.dart';
import '../widgets/schedule_header.dart';

class ScheduleHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppMultiCalendarBloc, AppMultiCalendarState>(
        bloc: sl<AppMultiCalendarBloc>(),
        builder: (context, calendarState) =>
            BlocBuilder<AppSelectBranchBloc, AppSelectBranchState>(
              bloc: sl<AppSelectBranchBloc>(),
              builder: (context, branchState) {
                var date = calendarState.date;
                var branch = sl<AppSelectBranchBloc>().getBranch();
                return ScheduleHeader(date: date, branch: branch);
              },
            ));
  }
}
