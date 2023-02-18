import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';

import '../utils.dart';

class AdminBranchesTabInformationRowLeftColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));



  Widget _build(BuildContext context) {
    Branch? branch = adminBranchesTabBloc.getCurrentBranch();
    double totalInvoice = (branch == null) ? 0.0 : totalInvoiceOfBranch(branch);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(BoldText(text: "ID")),
              textPadding(BoldText(text: "Total invoice")),
              textPadding(BoldText(text: "Name")),

            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(InfoText(text: branch?.id.toString() ?? "")),
              textPadding(InfoText(text: StringUtils.formatCurrency(totalInvoice))),
              textPadding(InfoText(text: branch?.name ?? "")),

            ],
          )
        ],
      ),
    );
  }
}
