import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/widgets/header.dart';

import 'Main/View.dart';
import 'sidebar/View.dart';

class CustomersView extends StatelessWidget{
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
                    CustomersSidebarView(),
                    CustomersMainView(),

                  ]),
                ],
              )),
        ),
      ),
    );
  }
}