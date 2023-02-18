import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Employees/controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';

import '../utils.dart';

class AdminEmployeeTabEmployeeRowLeftColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminEmployeeTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));



  Widget _build(BuildContext context) {
    var employee = adminEmployeeTabBloc.getCurrent();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(BoldText(text: "ID")),
              textPadding(BoldText(text: "Name")),
              textPadding(BoldText(text: "Role")),

            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(InfoText(text: employee?.id.toString() ?? "")),
              textPadding(InfoText(text: employee?.name ?? "")),
              textPadding(InfoText(text: employee?.role ?? "")),

            ],
          )
        ],
      ),
    );
  }
}
