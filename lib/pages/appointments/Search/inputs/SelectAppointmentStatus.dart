import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/appointments/Search/Controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledDropdownButton.dart';

class AppointmentsSearchSelectAppointmentStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: appointmentSearchBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var options = ["Pending", "Confirmed", "Completed", "Cancelled"];
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Appt. Status", style: FlutterFlowTheme.of(context).bodyText1),
          ControlledDropdownButton<String>(
            options: options,
            value: appointmentSearchBloc.value.status,
            onChanged: (value) {
              if (value != null) {
                appointmentSearchBloc
                    .setAppointmentStatus(value);
              }
            },
            iconOnClick: () => appointmentSearchBloc.setAppointmentStatus(null),
          )
        ],
      ),
    );
  }

  capitalize(String string) {}
}
