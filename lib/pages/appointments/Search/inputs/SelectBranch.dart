import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/appointments/Search/Controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledDropdownButton.dart';

class AppointmentsSearchSelectBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: appointmentSearchBloc.stream,
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
            value: appointmentSearchBloc.value.branch,
            onChanged: (value) {
              if (value != null) {
                appointmentSearchBloc.setBranch(value as String);
              }
            },
            iconOnClick:() =>  appointmentSearchBloc.setBranch(null),
          )
        ],
      ),
    );
  }
}
