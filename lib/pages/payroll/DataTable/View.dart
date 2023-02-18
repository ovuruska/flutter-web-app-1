import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/payroll/DataTable/Data.dart';

import '../Controller.dart';
import 'columns.dart';

class PayrollDataTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: payrollViewBloc.stream,
      listener: (value) {
      },
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var _data = PayrollData();
    return PaginatedDataTable2(
      rowsPerPage: 20,
      columns: columns
          .map<DataColumn>((name) => DataColumn(
              label: Text(name,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Inter', fontWeight: FontWeight.w600))))
          .toList(),
      source: _data,
    );
  }
}
