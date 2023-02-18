import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/appointments/Search/Controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledDropdownButton.dart';

import '../Model.dart';

class AppointmentsSearchSelectEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder<AppointmentsSearchModel>(
      stream: appointmentSearchBloc.stream,
      listener: (value) {
      },
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var options = employeesBloc.value.employees.map<String>((e) => e.name).toList();
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Select employee", style: FlutterFlowTheme.of(context).bodyText1),
          ControlledDropdownButton<String>(
            options: options,
            value: appointmentSearchBloc.value.employee,
            onChanged: (value) {
              appointmentSearchBloc.setEmployee(value as String);
            },
            iconOnClick:() =>  appointmentSearchBloc.setEmployee(null),
          )
        ],
      ),
    );
  }
}
