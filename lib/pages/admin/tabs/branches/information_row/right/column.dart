import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';
import 'package:scrubbers_employee_application/widgets/headless_table%202.dart';

import '../utils.dart';

class AdminBranchesTabInformationRowRightColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    Branch? branch = adminBranchesTabBloc.getCurrentBranch();

    return Container(
      child:HeadlessDataTable(
        numberOfColumns: 2,
        rows: [
          DataRow(cells: [
            DataCell(textPadding(BoldText(text: "Description"))),
            DataCell(textPadding(InfoText(text: branch?.description ?? ""))),
          ]),
          DataRow(cells: [
            DataCell(textPadding(BoldText(text: "Phone number"))),
            DataCell(textPadding(InfoText(text: branch?.phone ?? ""))),
          ]),
          DataRow(cells: [
            DataCell(textPadding(BoldText(text: "Address"))),
            DataCell(textPadding(InfoText(text: branch?.address ?? ""))),
          ]),
        ],
      )
    );


  }
}
