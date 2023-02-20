import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';


class BranchItem extends StatelessWidget {
  final Branch branch;
  final Function(Branch?)? onTap;
  final bool selected;

  BranchItem({required this.branch, this.onTap, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () {
              if (onTap != null) onTap!(branch);

            },
            child: Container(
              padding: EdgeInsets.only(left: 8),
              width: 100,
              decoration: BoxDecoration(
                  color: (!this.selected)
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).primaryColor),
              child: Text(
                branch.name,
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            )));
  }
}
