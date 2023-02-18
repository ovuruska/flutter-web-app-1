import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import 'controller.dart';
import 'EmployeeRow/view.dart';
import 'sidebar/view.dart';
import 'content/controller.dart';
import 'content/view.dart';

class AdminEmployeeTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminEmployeesWeeklyScheduleBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    return Container(
        child: Flex(direction: Axis.horizontal, children: [
      Container(
          width: 384, child: Expanded(child: AdminEmployeeTabSidebarView())),
      Expanded(
          child: Flex(direction: Axis.vertical, children: [
        AdminEmployeeTabEmployeeRowView(),
        Divider(
          height: 16,
          thickness: 1,
          color: Colors.black.withOpacity(.3),
          indent: 16,
          endIndent: 16,
        ),
        adminEmployeeTabBloc.value.currentIndex < 0
            ? Container()
            : AdminEmployeesContent(),
        adminEmployeeTabBloc.value.currentIndex < 0
            ? Container()
            : Container(
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 96,
                      height: 32,
                      child: ElevatedButton(
                          onPressed: () {
                            adminEmployeesWeeklyScheduleBloc.clear();
                          },
                          child: Text("Clear")),
                    ),
                    Container(width: 16),
                  ],
                ))
      ])),
    ]));
  }
}
