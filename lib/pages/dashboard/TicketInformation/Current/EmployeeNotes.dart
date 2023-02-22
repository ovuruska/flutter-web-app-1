import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'Header.dart';
import 'TextInput.dart';

class TicketInformationCurrentAppointmentEmployeeNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(stream: ticketInformationInputBloc.stream, listener: (val){}, builder: (context, snapshot) => _build(context));
  Widget _build(BuildContext context){
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        CurrentAppointmentHeader(),
        Expanded(
          child:Container(
            padding: EdgeInsets.all(8),
            child:  EmployeeNotesTextInput(appointment: ticketInformationInputBloc.value.appointment!,))
        )
      ],
    ));
  }
}
