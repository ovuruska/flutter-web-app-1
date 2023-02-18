import 'package:flutter/material.dart';

import 'ButtonGroup.dart';
import 'LeftColumn/View.dart';
import 'RightColumn/View.dart';

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
