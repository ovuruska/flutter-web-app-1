import 'package:flutter/material.dart';
import '../../appointment_context_provider.dart';
import 'header.dart';
import 'text_input.dart';

class TicketInformationCurrentAppointmentEmployeeNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        CurrentAppointmentHeader(),
        Expanded(
          child:Container(
            padding: EdgeInsets.all(8),
            child:  EmployeeNotesTextInput(appointment:appointment,))
        )
      ],
    ));
  }
}
