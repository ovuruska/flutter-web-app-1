import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/shadow.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'branches/view.dart';
import 'calendar/view.dart';
import 'tabs/view.dart';

class DashboardSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 300),
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        child: Flex(
          mainAxisSize: MainAxisSize.max,
          direction: Axis.vertical,
          children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: BranchesView()),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: ShadowContainer(
                  child:Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,

                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: SidebarCalendarView(),
                    )),
              )),
            ),
            SidebarTabsView(),
          ],
        ),
      ),
    );
  }
}
