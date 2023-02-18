import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/DailySchedule/NotSelected.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';

import 'Selected.dart';

class DashboardDailyScheduleView extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      StreamListenableBuilder(stream: sidebarBloc.stream, listener: (value){} , builder:(context,snapshot) => _build(context));
  Widget _build(BuildContext context){
    var isBranchSelected = sidebarBloc.value.currentBranch.id != "";

    if (isBranchSelected) {
      return DashboardDailyScheduleSelectedView();
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: DashboardDailyScheduleNotSelectedView(),
      );
    }
  }
}
