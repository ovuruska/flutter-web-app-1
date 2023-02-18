import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import 'AppointmentData.dart';
import 'Controller.dart';

class AppointmentsDataTableView extends StatelessWidget {
  var columns = [
    'Ticket ID',
    'Customer',
    'Dog',
    'Service',
    'Employee',
    'Branch',
    'Date',
    'Status'
  ];

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: appointmentsDataTableBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var _data = AppointmentData();

    return Flexible(
        child: PaginatedDataTable2(
      rowsPerPage: 20,
      columns: columns
          .map<DataColumn>((name) => DataColumn(
              label: Text(name,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Inter', fontWeight: FontWeight.w600))))
          .toList(),
      source: _data,
    ));
  }
}
