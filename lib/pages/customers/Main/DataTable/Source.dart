import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/customers/Controller.dart';
import 'package:scrubbers_employee_application/pages/appointments/DataTable/Controller.dart';
import 'package:scrubbers_employee_application/pages/customers/Controller.dart';

import '../../utils.dart';


class CustomersMainDataTableSource extends DataTableSource {

  var data = getCustomerAppointments(customersBloc.value.customers[customersViewBloc.value.currentIndex]);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

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
    var apptDate = getDate(data[index].start);
    var start = data[index].start;
    var end = data[index].end;
    var duration = end.difference(start);
    return DataRow(cells: [
      getCell(data[index].id),
      getCell(data[index].employee.name),
      getCell(apptDate),
      getCell(data[index].appointmentType),
      getCell(duration.inMinutes.toString()),
      getCell(data[index].employeeNotes),
      getCell(data[index].customerNotes),
    ]);
  }
}
