import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/view_logs/presentation/widgets/log_list.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import '../../domain/entity/log_entity.dart';

class LogTabs extends StatelessWidget {
  final List<LogEntity> logs;
  const LogTabs({Key? key, required this.logs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              bottom: TabBar(
                physics: NeverScrollableScrollPhysics(),
                tabs: [
                  Tab(text: 'Employee'),
                  Tab(text: 'Customer'),
                ],
              ),
              title: Text('History'),
            ),
            body: TabBarView(children: [
              LogList(logs: logs.where((log) => log.isEmployee()).toList()),
              LogList(logs: logs.where((log) => log.isCustomer()).toList())
            ])));
  }
}
