import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledDropdownButton.dart';
import '../controller.dart';

class AdminEmployeeTabEmployeeRowRightColumnSelectBranch extends StatelessWidget {



  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminEmployeeTabEmployeeRowBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var options = branchesBloc.value.branches;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Branch", style: FlutterFlowTheme.of(context).bodyText1),
          ControlledDropdownButton<Branch>(
            options: options,
            value: adminEmployeeTabEmployeeRowBloc.value.branch,
            onChanged: (value) {
              if (value != null) {
                adminEmployeeTabEmployeeRowBloc.setBranch(value);
              }
            },
            iconOnClick:() =>  adminEmployeeTabEmployeeRowBloc.setBranch(null),
          )
        ],
      ),
    );
  }
}
