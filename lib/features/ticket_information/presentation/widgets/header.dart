import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import 'appointment_context_provider.dart';



class TicketInformationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;
    return Container(
        height:48,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color(0xFFD4ECFF)),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Text("Ticket - " + appointment.id.toString(),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title2)),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Text(".",
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title2)),
                (appointment.status == "Pending")
                    ? Text(
                  "UNCONFIRMED",
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Inter',
                    color: const Color(0xFFFF5B5B),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                )
                    : Container(),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: Icon(
                Icons.close,
                color: Colors.red,
              ))
        ]));
  }
}
