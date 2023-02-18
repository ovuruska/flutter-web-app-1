import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_employee/model.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_employee/schedule.dart';

import '../controller.dart';
import 'controller.dart';



class AdminEmployeesContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) =>
      StreamListenableBuilder(
          stream: adminEmployeesWeeklyScheduleBloc.stream,
          listener: (value) {},
          builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {

    return Container(
        margin: EdgeInsets.all(16),
        child: Flex(direction: Axis.vertical, children: [
          Text("Weekly Schedule", style: TextStyle(fontSize: 24)),
          WeeklyScheduleEmployee(data: adminEmployeesWeeklyScheduleBloc.value.items, onChanged: (WeeklyScheduleEmployeeModel data) {
            adminEmployeesWeeklyScheduleBloc.update(data);
            var employee = adminEmployeeTabBloc.getCurrent();
            adminEmployeesWeeklyScheduleBloc.saveDay(int.parse(employee!.id), data);
          },

          )

        ]));
  }
}
