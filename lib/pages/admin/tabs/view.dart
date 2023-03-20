import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/admin_branches/admin_branches.dart';
import 'package:scrubbers_employee_application/widgets/header.dart';


class AdminTabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, // length of tabs
        initialIndex: 0,
        child: Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Header(),
                  Expanded(child: AdminBranchesTab())
                ]))));
  }
}
