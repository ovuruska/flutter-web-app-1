import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';

import 'selector.dart';

class AdminBranchesTabDataTableSource extends DataTableSource {
  // Generate some made-up services

  List<Employee> branchEmployees = getBranchEmployees();

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => branchEmployees.length;

  @override
  int get selectedRowCount => 0;

  @override
  String getDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }

  DataCell getCell(String text) {
    return DataCell(Text(text));
  }

  DataRow getRow(int index) {
    var id = branchEmployees[index].id;
    var name = branchEmployees[index].name;
    var phone = branchEmployees[index].phone;
    var email = branchEmployees[index].email;
    var role = branchEmployees[index].role;

    return DataRow(cells: [
      getCell(id),
      getCell(name),
      getCell(role),
      getCell(phone),
      getCell(email),
    ]);
  }
}
