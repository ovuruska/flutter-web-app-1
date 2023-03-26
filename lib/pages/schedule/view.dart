import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import 'package:scrubbers_employee_application/pages/schedule/schedule_page_context.dart';
import 'package:scrubbers_employee_application/pages/schedule/state.dart';

import '../../features/app_select_branch/presentation/bloc/app_select_branch_event.dart';
import '../../injection.dart';
import 'register.dart';
import 'screen_factory.dart';

class ScheduleView extends StatefulWidget {
  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  void initState() {
    registerSchedulePage(sl);
    sl<AppSelectBranchBloc>().add(AppSelectBranchEventGetAll());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: ScheduleViewStateProvider(
          child: ScheduleViewScreenFactory(),
        ));
  }
}
