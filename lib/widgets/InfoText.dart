import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class InfoText extends StatelessWidget {
  String text;
  double? fontSize;

  InfoText({required this.text, this.fontSize = null});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        style: FlutterFlowTheme.of(context).bodyText1.merge(TextStyle(
            decoration: TextDecoration.none,
            overflow: TextOverflow.ellipsis,
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: fontSize)));
  }
}
