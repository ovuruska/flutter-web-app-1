import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/controller.dart';

class AdminBranchesTabListItem extends StatelessWidget {
  final Branch branch;
  bool selected;
  int index;

  AdminBranchesTabListItem(
      {Key? key,
      required this.branch,
      required this.index,
      this.selected = false})
      : super(key: key);

  Widget _selected(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              color: selected
                  ? FlutterFlowTheme.of(context).secondaryColor
                  : FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    branch.name,
                    style: TextStyle(
                        fontSize: 16,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );

  Widget _nonselected(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              color: selected
                  ? FlutterFlowTheme.of(context).secondaryColor
                  : FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    branch.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );

  onClick() {
    adminBranchesTabBloc.setCurrentIndex(index);
    adminBranchesTabBloc.setBranch(branch);
  }

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return _selected(context);
    } else {
      return _nonselected(context);
    }
  }
}
