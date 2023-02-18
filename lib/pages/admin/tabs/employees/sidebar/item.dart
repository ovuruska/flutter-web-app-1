import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';


class AdminEmployeeTabListItem extends StatelessWidget {
  final Employee employee;
  bool selected;
  final Function(int) onClick;
  int index;

  AdminEmployeeTabListItem(
      {Key? key,
      required this.employee,
      required this.index,
        required this.onClick,
      this.selected = false})
      : super(key: key);

  Widget _selected(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: handleClick,
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
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    employee.name,
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            employee.branch.name,
                            style: FlutterFlowTheme.of(context).subtitle3.merge(
                                  TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                          ),
                          Text(
                            employee.role,
                            style: FlutterFlowTheme.of(context).subtitle3.merge(
                                  TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      );

  Widget _nonselected(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: handleClick,
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
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    employee.name,
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            employee.branch.name,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowTheme.of(context).subtitle3.merge(
                                  TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                  ),
                                ),
                          ),
                          Text(
                            employee.role,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowTheme.of(context).subtitle3,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      );

  handleClick() {
    onClick(index);
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
