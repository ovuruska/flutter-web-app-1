import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Employees/controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';

import '../../../../../../models/Employee.dart';
import '../../../../../../widgets/headless_table 2.dart';

class AdminEmployeeTabEmployeeRowLeftColumn extends StatelessWidget {

  final Employee? employee;

  const AdminEmployeeTabEmployeeRowLeftColumn({Key? key, this.employee}) : super(key: key);


  Widget build(BuildContext context) {
    return Container(
      child:HeadlessDataTable(
        numberOfColumns: 2,
        rows:[
          DataRow(cells: [
            DataCell(BoldText(text: "ID")),
            DataCell(InfoText(text: employee?.id.toString() ?? "")),
          ]),
          DataRow(cells: [
            DataCell(BoldText(text: "Name")),
            DataCell(InfoText(text: employee?.name ?? "")),
          ]),
          DataRow(cells: [
            DataCell(BoldText(text: "Role")),
            DataCell(InfoText(text: employee?.role ?? "")),
          ]),
        ]
      )

    );
  }
}
