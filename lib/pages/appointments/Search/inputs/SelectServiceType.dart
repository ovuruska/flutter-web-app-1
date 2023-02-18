import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/appointments/Search/Controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledDropdownButton.dart';

import '../Model.dart';

class AppointmentsSearchSelectServiceType extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder<AppointmentsSearchModel>(
      stream: appointmentSearchBloc.stream,
      listener: (value) {
      },
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var options = ["We Wash", "Full Grooming"];
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Service type", style: FlutterFlowTheme.of(context).bodyText1),
          ControlledDropdownButton<String>(
            options: options,
            value: appointmentSearchBloc.value.serviceType,
            onChanged: (value) {
              appointmentSearchBloc.setServiceType(value as String);
            },
            iconOnClick:() =>  appointmentSearchBloc.setServiceType(null),
          )
        ],
      ),
    );
  }
}
