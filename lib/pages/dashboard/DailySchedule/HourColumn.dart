import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';
import '../constants.dart';

class HourColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (int i = startHour; i <= numberOfHours + startHour; i++)
            Container(
              height: hourColumnHeight.toDouble(),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Text(StringUtils.getFormattedHour(i),
                        style: FlutterFlowTheme.of(context).bodyText2),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
