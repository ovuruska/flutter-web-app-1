import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';
import 'package:scrubbers_employee_application/widgets/headless_table%202.dart';

import '../utils.dart';

class AdminBranchesTabInformationRowLeftColumn extends StatelessWidget {
  final Branch? branch;

  const AdminBranchesTabInformationRowLeftColumn(
      {Key? key, required this.branch})
      : super(key: key);

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  @override
  Widget _build(BuildContext context) {
    var branch = adminBranchesTabBloc.current();
    double totalInvoice =
        (branch == null) ? 0.0 : totalInvoiceOfBranch(branch!);
    return HeadlessDataTable(
      rows: [
        DataRow(cells: [
          DataCell(textPadding(BoldText(text: "ID"))),
          DataCell(textPadding(InfoText(text: branch?.id.toString() ?? ""))),
        ]),
        DataRow(cells: [
          DataCell(textPadding(BoldText(text: "Total invoice"))),
          DataCell(textPadding(
              InfoText(text: StringUtils.formatCurrency(totalInvoice)))),
        ]),
        DataRow(cells: [
          DataCell(textPadding(BoldText(text: "Name"))),
          DataCell(textPadding(InfoText(text: branch?.name ?? ""))),
        ]),
      ],
      numberOfColumns: 2,
    );
  }
}
