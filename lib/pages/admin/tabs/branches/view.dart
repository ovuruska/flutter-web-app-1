import 'package:flutter/material.dart';

import '../../../../features/sidebars/branch_search/presentation/pages/search_branches.dart';
import 'controller.dart';
import 'information_row/view.dart';
import 'content/controller.dart';
import 'content/view.dart';

class AdminBranchesTabView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Flex(direction: Axis.horizontal,crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
        flex: 1,
          child: SearchBranchesView()),
      Expanded(
        flex:4,
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
