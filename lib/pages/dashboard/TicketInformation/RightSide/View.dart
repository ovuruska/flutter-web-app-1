import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import 'ButtonGroup.dart';
import 'ClientInformation.dart';
import 'Notes.dart';
import 'PetInformation.dart';
import 'SpecialHandling.dart';

class TicketInformationRightSideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F5FA),
          borderRadius: BorderRadius.circular(1),
        ),
        child: Column(children: [
          Container(
              height: 128,
              padding: EdgeInsets.all(8),
              child: TicketInformationClientInformation()),
          Container(
              height: 96,
              padding: EdgeInsets.all(8),
              child: TicketInformationRightButtonGroup()),
          Container(
              height: 216,
              padding: EdgeInsets.all(8),
              child: TicketInformationPetInformation()),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: TicketInformationRightSideNotes())),
        ]));
  }
}
