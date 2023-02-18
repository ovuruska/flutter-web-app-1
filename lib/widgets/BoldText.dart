import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class BoldText extends StatelessWidget {
  String text;

  BoldText({
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: FlutterFlowTheme.of(context).bodyText1.merge(
        TextStyle(
          decoration: TextDecoration.none,
            color: FlutterFlowTheme
                .of(context)
                .primaryText,
            fontWeight: FontWeight.bold
        )
    ));
  }

}