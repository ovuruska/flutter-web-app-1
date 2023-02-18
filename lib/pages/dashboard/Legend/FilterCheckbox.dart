import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class DashboardLegendFilterCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) onChanged;

  const DashboardLegendFilterCheckbox(
      {Key? key,
      required this.label,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child:Container(
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Checkbox(
              checkColor: FlutterFlowTheme.of(context).primaryBackground,
              value: value,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                }
              },
            ),
            Text(label)
          ]))
    );
  }
}
