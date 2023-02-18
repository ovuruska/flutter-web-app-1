import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/appointments/DataTable/View.dart';
import 'package:scrubbers_employee_application/widgets/header.dart';

import 'Search/View.dart';

class AppointmentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Header(),
                  Row(children: [
                    Container(
                        constraints: BoxConstraints(
                          minHeight: 384,
                        ),
                        width: MediaQuery.of(context).size.width * .25,
                        height: MediaQuery.of(context).size.height - 48,
                        child: Column(
                          children: [Expanded(child: AppointmentsSearchView())],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * .75,
                        height: MediaQuery.of(context).size.height - 48,
                        child: AppointmentsDataTableView())
                  ]),
                ],
              )),
        ),
      ),
    );
  }
}
