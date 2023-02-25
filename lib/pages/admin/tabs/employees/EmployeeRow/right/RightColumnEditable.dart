import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';
import 'package:scrubbers_employee_application/widgets/headless_table%202.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../../controller.dart';
import '../controller.dart';
import '../utils.dart';
import 'SelectBranch.dart';
import 'utils.dart';

class AdminEmployeeTabEmployeeRowRightColumnEditable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var employee = adminEmployeeTabBloc.getCurrent();
    var totalInvoice = 0.0;
    if(employee != null) totalInvoice = totalInvoiceOfEmployee(employee);

    return Container(

      child:HeadlessDataTable(rows: [
        DataRow(cells: [
          DataCell(textPadding(BoldText(text: "Total invoice"))),
          DataCell(textPadding(InfoText(text:totalInvoice.toStringAsFixed(2)))),
        ]),
        DataRow(cells:[
          DataCell(textPadding(BoldText(text: "Phone number"))),
          DataCell(Flexible(child:ClearableTextInput(
            boxWidth: 256,
            initialValue: employee?.phone ?? "",
            onChanged: (String? value) {
              if(value == null){
                adminEmployeeTabEmployeeRowBloc.setPhone("");
              }else{
                adminEmployeeTabEmployeeRowBloc.setPhone(value);
              }
            },),))
        ]),
        DataRow(cells:[
          DataCell(textPadding(BoldText(text: "Branch"))),
          DataCell(Flexible(child:AdminEmployeeTabEmployeeRowRightColumnSelectBranch(branch: employee?.branch,)))
        ])
      ], numberOfColumns: 2,

      ));


  }
}