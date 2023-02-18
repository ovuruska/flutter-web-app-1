import 'package:flutter/material.dart';

import '../Controller.dart';

class PayrollData extends DataTableSource {
  // Generate some made-up data

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => payrollViewBloc.value.payrolls.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataCell getCell(String text) {
    return DataCell(Text(text));
  }

  DataRow getRow(int index) {
    var totalCost = payrollViewBloc.value.payrolls[index].productCost +
        payrollViewBloc.value.payrolls[index].serviceCost +
        payrollViewBloc.value.payrolls[index].tips;
    return DataRow(cells: [
      getCell(payrollViewBloc.value.payrolls[index].employeeName),
      getCell(payrollViewBloc.value.payrolls[index].serviceCost.toString()),
      getCell(payrollViewBloc.value.payrolls[index].workingHours.toString()),
      getCell(payrollViewBloc.value.payrolls[index].productCost.toString()),
      getCell(payrollViewBloc.value.payrolls[index].tips.toString()),
      getCell(totalCost.toString()),
    ]);
  }
}
