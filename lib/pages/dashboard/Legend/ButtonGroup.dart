

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_widgets.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';

class DashboardLegendButtonGroup extends StatelessWidget{


  Color getColor(BuildContext context, String service) => (dashboardBloc.value.currentService == service) ? FlutterFlowTheme.of(context)
      .primaryColor : FlutterFlowTheme.of(context).primaryBackground;

  FFButtonWidget getButton(BuildContext context,String service) =>  FFButtonWidget(
      onPressed: () {
        dashboardBloc.setService(service);
      },
      text: service,
      options:buttonOptions(context, service)
  );

  FFButtonOptions buttonOptions(BuildContext context, String service) => FFButtonOptions(
    width: 128,
    height: 24,
    color: getColor(context, service),
    textStyle:FlutterFlowTheme.of(context).bodyText2,
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 1,
    ),
    borderRadius:
    BorderRadius.circular(2),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context)
            .secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          getButton(context,"Full Grooming"),
          getButton(context,"We Wash"),
        ],
      ),
    );

  }


}