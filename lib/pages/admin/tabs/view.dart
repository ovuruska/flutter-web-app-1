import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/widgets/header.dart';

import 'branches/view.dart';
import 'employees/view.dart';
import 'Services/view.dart';

class AdminTabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // length of tabs
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Header(),
              TabBar(tabs: [
                Tab(
                    child: Text(
                  'Employees',
                  style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText),
                )),
                Tab(
                    child: Text(
                  'Branches',
                  style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText),
                )),
                Tab(
                    child: Text(
                  'Services',
                  style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText),
                )),
              ]),
              Expanded(
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                    AdminEmployeeTabView(),
                    AdminBranchesTabView(),
                    AdminServicesTabView(),
                  ])),
            ],
          )),
        ),
      ),
    );
  }
}
