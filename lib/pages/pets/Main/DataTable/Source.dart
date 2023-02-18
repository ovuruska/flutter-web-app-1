import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/appointments/DataTable/Controller.dart';

import 'Controller.dart';

class PetsMainDataTableSource extends DataTableSource {
  // Generate some made-up data

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => petsMainDataTableBloc.value.filtered.length;

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
    var apptDate = getDate(petsMainDataTableBloc.value.filtered[index].start);
    var start = petsMainDataTableBloc.value.filtered[index].start;
    var end = petsMainDataTableBloc.value.filtered[index].end;
    var duration = end.difference(start);
    return DataRow(cells: [
      getCell(petsMainDataTableBloc.value.filtered[index].id),
      getCell(petsMainDataTableBloc.value.filtered[index].customer.name),
      getCell(apptDate),
      getCell(petsMainDataTableBloc.value.filtered[index].services[0].name),
      getCell(duration.inMinutes.toString()),
      getCell(petsMainDataTableBloc.value.filtered[index].employeeNotes),
      getCell(petsMainDataTableBloc.value.filtered[index].customerNotes),
    ]);
  }
}
