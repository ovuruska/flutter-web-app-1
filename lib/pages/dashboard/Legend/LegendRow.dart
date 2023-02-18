import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';

import '../sidebar/calendar/controller.dart';
import 'EmployeeSelect.dart';
import 'PrintButton.dart';

class DashboardLegendRow extends StatelessWidget {
  Widget getLegend(BuildContext context, Color color, String label) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 32,
              height: 16,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  width: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
              child: Text(
                label,
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getLegendsWithIcon(BuildContext context, Icon icon, String label) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            icon,
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
              child: Text(
                label,
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateFormat format = new DateFormat("MMMM dd, yyyy");
    var dateString = format.format(sidebarCalendarBloc.value.selectedDate);
    return Container(
        child: Expanded(
            child: Row(mainAxisSize: MainAxisSize.max, children: [
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
        child: Text(
          dateString,
          style: FlutterFlowTheme.of(context).bodyText2,
        ),
      ),
      VerticalDivider(
        endIndent: 16,
        indent:16,
        color: FlutterFlowTheme.of(context).primaryText,
        width:16
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: DashboardEmployeeSelectDropdown(),
      ),
      getLegendsWithIcon(
          context,
          Icon(
            Icons.star_rounded,
            color: FlutterFlowTheme.of(context).alternate,
            size: 16,
          ),
          "Special handling"),
      getLegendsWithIcon(
          context,
          Icon(
            Icons.check,
            color: Color(0xFF4CBB17),
            size: 16,
          ),
          "Confirmed"),
      getLegend(context, Color(0xFFD2D2D2), "Off"),
      getLegend(
          context, FlutterFlowTheme.of(context).secondaryColor, "New Client"),
      getLegend(context, FlutterFlowTheme.of(context).alternate, "Time Block"),
      getLegend(context, blueAccent, "Regular"),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: DashboardLegendPrintButton(),
      ),
    ])));
  }
}
