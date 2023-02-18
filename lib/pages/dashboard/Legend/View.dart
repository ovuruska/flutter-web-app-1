import 'package:flutter/material.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import 'FilterRow.dart';
import 'LegendRow.dart';

class DashboardLegendView extends StatelessWidget {
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        minHeight: 128,
      ),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children:[
            DashboardLegendRow(),
            DashboardLegendFilterRow()
          ]
        )
      ),
    );
  }
}


