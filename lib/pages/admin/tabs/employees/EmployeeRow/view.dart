import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../controller.dart';
import 'button_group.dart';
import 'left/View.dart';
import 'right/View.dart';

class AdminEmployeeTabEmployeeRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminEmployeeTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    return Container(
      height: 192,
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AdminEmployeeTabEmployeeRowLeftColumnView(),
          AdminEmployeeTabEmployeeRowRightColumnView(),
          AdminEmployeeTabEmployeeRowButtonGroup()
        ],
      ),
    );
  }
}
