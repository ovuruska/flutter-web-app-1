import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/controller.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_branch/schedule.dart';

import 'controller.dart';

class AdminBranchesTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesWeeklyScheduleBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        child: Flex(direction: Axis.vertical, children: [
          Text("Weekly Schedule", style: TextStyle(fontSize: 24)),
          WeeklyScheduleBranch(data: adminBranchesWeeklyScheduleBloc.value.items, onChanged: (data) {
            adminBranchesWeeklyScheduleBloc.update(data);
            var branch = adminBranchesTabBloc.getCurrentBranch();
            if(branch != null){
              adminBranchesWeeklyScheduleBloc.saveDay(branch.id, data);
            }
          },

          )        ]));
  }
}
