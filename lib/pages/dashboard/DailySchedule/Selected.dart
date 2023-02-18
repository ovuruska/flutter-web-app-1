import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/DailySchedule/Bloc.dart';
import 'package:scrubbers_employee_application/pages/dashboard/Legend/Controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';

import '../controller.dart';
import 'HourColumn.dart';
import 'Inner.dart';

class DashboardDailyScheduleSelectedView extends StatefulWidget {
  @override
  _DashboardDailyScheduleSelectedViewState createState() =>
      _DashboardDailyScheduleSelectedViewState();
}

class _DashboardDailyScheduleSelectedViewState
    extends State<DashboardDailyScheduleSelectedView> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboardDailyScheduleBloc.setScreenshotController(screenshotController);
    });
  }

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: employeesBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => StreamListenableBuilder(
          stream: sidebarBloc.stream,
          listener: (value) {},
          builder: (context, snapshot) => StreamListenableBuilder(
              stream: dashboardLegendBloc.stream,
              listener: (value) {},
              builder: (context, snapshot) => _build(context))));

  Widget _build(BuildContext context) {
    var branchEmployees = employeesBloc.value.employees.where((element) {
      if (element.branch.id == sidebarBloc.value.currentBranch.id) {
        var currentService = dashboardLegendBloc.value.dropdownValue;
        if (currentService == "All Employees") {
          return true;
        } else if (element.role == currentService) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    }).toList();

    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Screenshot(
          controller: screenshotController,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: HourColumn(),
                    ),
                  ] +
                  List<Widget>.generate(
                      branchEmployees.length,
                      (index) => DashboardDailyScheduleInner(
                          employee: branchEmployees[index])))),
    ));
  }
}
