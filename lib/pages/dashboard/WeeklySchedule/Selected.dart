import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/DailySchedule/Bloc.dart';
import 'package:scrubbers_employee_application/pages/dashboard/Legend/Controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/calendar/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';

import '../DailySchedule/HourColumn.dart';
import 'DayColumn.dart';

class DashboardWeeklyScheduleViewSelectedView extends StatefulWidget {
  @override
  _DashboardWeeklyScheduleViewSelectedViewState createState() =>
      _DashboardWeeklyScheduleViewSelectedViewState();
}

class _DashboardWeeklyScheduleViewSelectedViewState
    extends State<DashboardWeeklyScheduleViewSelectedView> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboardDailyScheduleBloc.setScreenshotController(screenshotController);
    });
  }

  List<DateTime> getWeekDays(DateTime date) {
    var startOfWeek = getDate(date.subtract(Duration(days: date.weekday - 1)));
    List<DateTime> days = [];

    for (var i = 0; i < DateTime.daysPerWeek; i++) {
      days.add(startOfWeek.add(Duration(days: i)));
    }

    return days;
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);


  @override
  Widget build(BuildContext context) =>
      StreamListenableBuilder(
          stream: sidebarCalendarBloc.stream,
          listener: (value) {},
          builder: (context, snapshot) =>
              StreamListenableBuilder(
                  stream: sidebarBloc.stream,
                  listener: (value) {},
                  builder: (context, snapshot) =>
                      StreamListenableBuilder(
                          stream: dashboardLegendBloc.stream,
                          listener: (value) {},
                          builder: (context, snapshot) => _build(context))));

  Widget _build(BuildContext context) {
    var dates = getWeekDays(sidebarCalendarBloc.value.selectedDate);

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
                  ] + dates.map<Widget>((date) => DashboardWeeklyScheduleDayColumn(date:date)).toList())),

        ));
  }
}
