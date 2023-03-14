import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/appointment_details.dart';


class ClientAppointmentsTable extends StatelessWidget{

  final List<AppointmentDetails> appointments;

  const ClientAppointmentsTable({Key? key, required this.appointments}) : super(key: key);

  Text _status(String status ){
    var color = Colors.black;
    if(status == "Completed" || status == "CheckedIn"){
      color = Colors.green;
    }else if(status == "Cancelled"){
      color = Colors.red;

    }else if(status == "Pending"){
      color = Colors.orange;
    }
    else if(status == "Confirmed"){
      color = Colors.blue;
    }else if(status == "InProgress"){
      color = Colors.purple;
    }else if(status == "NoShow"){
      color = Colors.grey;
    }else if(status == "Rescheduling"){
      color = Colors.greenAccent;
    }else if(status == "ClosedCharged"){
      color = Colors.green;
    }
    else {
      color = Colors.black;
    }
    return Text(status,style: TextStyle(color: color,fontWeight: FontWeight.bold));

  }

  DataRow _cell(AppointmentDetails appointment) {

    // 3:30 PM
    var date = new DateFormat('MM/dd/yyyy').format(appointment.start);
    var formatter = new DateFormat('h:mm a');
    // Difference between end and start in minutes.
    var duration = appointment.end.difference(appointment.start).inMinutes;

    return DataRow(cells: [
      DataCell(Text(appointment.id.toString())),
      DataCell(Text(date)),
      DataCell(Text(formatter.format(appointment.start))),
      DataCell(Text("${duration} mins")),
      DataCell(Text(appointment.service)),
      DataCell(Text(appointment.employeeName)),
      DataCell(Text(appointment.petName)),
      DataCell(_status(appointment.status)),
      DataCell(Text(appointment.groomerNotes)),
    ]);
  }
  _dataColumn(String label, {ColumnSize size = ColumnSize.M}) {
    return DataColumn2(
      label: Text(label,style: TextStyle(
          color:const Color(0xFF6E7C87)
      )),
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      columns: [
        _dataColumn("Ticket Id",size: ColumnSize.S),
        _dataColumn('Date'),
        _dataColumn('Time'),
        _dataColumn('Duration'),
        _dataColumn('Service'),
        _dataColumn('Employee'),
        _dataColumn('Pet name'),
        _dataColumn('Status'),
        _dataColumn('Grooming notes', size: ColumnSize.L),
      ],
      rows:appointments.map(_cell).toList());
  }

}