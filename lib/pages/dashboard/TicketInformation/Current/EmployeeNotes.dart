import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Header.dart';
import 'TextInput.dart';

class TicketInformationCurrentAppointmentEmployeeNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CurrentAppointmentHeader(),
            Container(
                padding: EdgeInsets.all(8), child: EmployeeNotesTextInput())
          ],
        ));
  }
}
