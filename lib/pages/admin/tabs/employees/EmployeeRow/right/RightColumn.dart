import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Employees/controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';
import 'package:scrubbers_employee_application/widgets/headless_table%202.dart';

import '../../../../../../models/Employee.dart';
import '../../../Employees/model.dart';
import '../utils.dart';
import 'utils.dart';

class AdminEmployeeTabEmployeeRowRightColumn extends StatelessWidget {
  final Employee? employee;

  const AdminEmployeeTabEmployeeRowRightColumn({Key? key, this.employee}) : super(key: key);



  Widget build(BuildContext context) {

    var totalInvoice = 0.0;
    if(employee != null) totalInvoice = totalInvoiceOfEmployee(employee!);
    return Container(
      child: HeadlessDataTable(
        numberOfColumns: 2,
        rows:[
          DataRow(cells: [
            DataCell(BoldText(text: "Total Invoice")),
            DataCell(InfoText(text: StringUtils.formatCurrency(totalInvoice),)),
          ]),
          DataRow(cells: [
            DataCell(BoldText(text: "Phone number")),
            DataCell(InfoText(text: employee?.phone ?? "")),
          ]),
          DataRow(cells: [
            DataCell(BoldText(text: "Branch name")),
            DataCell(InfoText(text: employee?.branch.name ?? "")),
          ]),
        ]
      )
    );
  }
}
