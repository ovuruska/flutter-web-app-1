import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import 'InputDashboard.dart';

class ServicesCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          minHeight: 384,
        ),
        height: MediaQuery.of(context).size.height * .33,
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryColor,
            width: 2,
          ),
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text(
                  'Create service',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Expanded(child: AppointmentSearchInputDashboard())
            ],
          ),
        ));
  }
}
