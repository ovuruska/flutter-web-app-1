import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/customers/Controller.dart';

import 'Source.dart';
import 'columns.dart';

class CustomersMainDataTableView extends StatelessWidget {
  Widget _table(BuildContext context) {
    var data = CustomersMainDataTableSource();
    return PaginatedDataTable2(
      columns: columns
          .map<DataColumn>((name) => DataColumn(
              label: Text(name,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Inter', fontWeight: FontWeight.w600))))
          .toList(),
      source: data,
    );
  }

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: customersViewBloc.stream,
      listener: (value) {
      },
      builder: (context, value) => _build(context));

  Widget _build(BuildContext context) {
    return Flexible(
      child: _table(context),
    );
  }
}