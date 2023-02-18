import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/widgets/header.dart';

import 'DataTable/View.dart';
import 'Filter/View.dart';

class PayrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Header(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child:PayrollFilterView()
                  ),
                  Flexible(child: PayrollDataTableView())

                ],
              )),
        ),
      ),
    );
  }
}
