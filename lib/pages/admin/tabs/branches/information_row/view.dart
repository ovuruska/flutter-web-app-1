import 'package:flutter/material.dart';

import '../../../../../common/StreamListenableBuilder.dart';
import '../controller.dart';
import 'button_group.dart';
import 'left/view.dart';
import 'right/view.dart';

class AdminBranchesTabInformationRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamListenableBuilder(
        stream: adminBranchesTabBloc.stream,
        listener: (value) {},
        builder: (context, snapshot) => _build(context));
  }

  Widget _build(BuildContext context) {
    var editable = adminBranchesTabBloc.value.editable;
    return Container(
      height: 192,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 256,
            child: AdminBranchesTabInformationRowLeftColumnView(),
          ),
          SizedBox(
            width: 512,
            child: AdminBranchesTabInformationRowRightColumnView(
                editable: editable),
          ),
          AdminBranchesTabInformationRowButtonGroup()
        ],
      ),
    );
  }
}
