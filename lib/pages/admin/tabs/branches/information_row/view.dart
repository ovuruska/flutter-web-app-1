import 'package:flutter/material.dart';

import 'button_group.dart';
import 'left/view.dart';
import 'right/view.dart';

class AdminBranchesTabInformationRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      height: 192,

      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AdminBranchesTabInformationRowLeftColumnView(),
          AdminBranchesTabInformationRowRightColumnView(),
          AdminBranchesTabInformationRowButtonGroup()
        ],
      ),
    );
  }
}
