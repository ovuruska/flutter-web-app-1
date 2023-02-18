import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledDropdownButton.dart';
import '../Controller.dart';

class PayrollFilterInputSelectBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: payrollFilterInputBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var options = branchesBloc.value.branches.map((e) => e.name).toList();
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Branch", style: FlutterFlowTheme.of(context).bodyText1),
          ControlledDropdownButton<String>(
            options: options,
            value: payrollFilterInputBloc.value.branchName,
            onChanged: (value) {
              if (value != null) {
                payrollFilterInputBloc.setBranchName(value as String);
              }
            },
            iconOnClick:() =>  payrollFilterInputBloc.setBranchName(null),
          )
        ],
      ),
    );
  }
}
