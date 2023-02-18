import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import 'Controller.dart';
import 'InformationRow/view.dart';
import 'sidebar/view.dart';
import 'content/controller.dart';
import 'content/view.dart';

class AdminBranchesTabView extends StatelessWidget {


  @override
  Widget build(BuildContext context) => StreamListenableBuilder(stream: adminBranchesTabBloc.stream, listener: (value){}, builder: (context, snapshot) => _build(context));
  Widget _build(BuildContext context) {
    return Container(
        child: Flex(direction: Axis.horizontal, children: [
      Container(
          width: 384, child: Expanded(child: AdminBranchesTabSidebarView())),
      Expanded(
          child: Flex(direction: Axis.vertical, children: [
        AdminBranchesTabInformationRowView(),
        Divider(
          height: 16,
          thickness: 1,
          color: Colors.black.withOpacity(.3),
          indent: 16,
          endIndent: 16,
        ),
        adminBranchesTabBloc.value.currentIndex < 0
            ? Container()
            : AdminBranchesTabContent(),
        adminBranchesTabBloc.value.currentIndex < 0
            ? Container()
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 96,
                    height: 32,
                    child: ElevatedButton(
                        onPressed: () {
                          adminBranchesWeeklyScheduleBloc.clear();
                        },
                        child: Text("Clear")),
                  )
                ],
              )
      ])),
    ]));
  }
}
