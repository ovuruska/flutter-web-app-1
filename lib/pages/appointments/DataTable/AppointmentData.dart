

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DataTypes.dart';
import 'package:scrubbers_employee_application/pages/appointments/DataTable/Controller.dart';


class AppointmentData extends DataTableSource {
  // Generate some made-up data


  var columns = [
    'Ticket ID',
    'Customer Name',
    'Dog Name',
    'Service Type',
    'Employee',
    'Branch',
    'Appointment Date',
    'Appointment Status'
  ];
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => appointmentsDataTableBloc.value.data.length;
  @override
  int get selectedRowCount => 0;
  @override

  String getDate(DateTime date){
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }

  DataCell getCell(String text){
    return DataCell(
        Text(text)
    );
  }

  DataRow getRow(int index) {
    return DataRow(cells: [
      getCell(appointmentsDataTableBloc.value.data[index].id),
      getCell(appointmentsDataTableBloc.value.data[index].customer.name),
      getCell(appointmentsDataTableBloc.value.data[index].dog.name),
      getCell(appointmentsDataTableBloc.value.data[index].appointmentType),
      getCell(appointmentsDataTableBloc.value.data[index].employee.name),
      getCell(appointmentsDataTableBloc.value.data[index].branch.name),
      getCell(getDate(appointmentsDataTableBloc.value.data[index].start)),
      getCell(DataTypes.convertToString(appointmentsDataTableBloc.value.data[index].status)),

    ]);
  }
}