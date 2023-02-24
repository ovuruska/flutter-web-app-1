import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/DailySchedule/View.dart';
import 'package:scrubbers_employee_application/pages/dashboard/Legend/Controller.dart';

import 'WeeklySchedule/View.dart';

class DashboardSchedules extends StatelessWidget {

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(stream: dashboardLegendBloc.stream, listener: (value){}, builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context){
    var dropdownValue = dashboardLegendBloc.value.dropdownValue;
    if(["All Employees", "We Wash", "Full Grooming"].contains(dropdownValue))
      return DashboardDailyScheduleView();
      else
        return DashboardWeeklyScheduleView();

  }

}