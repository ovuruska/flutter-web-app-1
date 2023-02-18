import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Employees/controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';

import '../utils.dart';
import 'utils.dart';

class AdminEmployeeTabEmployeeRowRightColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminEmployeeTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));


  Widget _build(BuildContext context) {

    var employee = adminEmployeeTabBloc.getCurrent();
    var totalInvoice = 0.0;
    if(employee != null) totalInvoice = totalInvoiceOfEmployee(employee);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(BoldText(text: "Total Invoice")),
              textPadding(BoldText(text: "Phone number")),
              textPadding(BoldText(text: "Branch name")),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(InfoText(text: StringUtils.formatCurrency(totalInvoice),)),
              textPadding(InfoText(text: employee?.phone ?? "")),
              textPadding(InfoText(text: employee?.branch.name ?? ""))
            ],
          )
        ],
      ),
    );
  }
}
