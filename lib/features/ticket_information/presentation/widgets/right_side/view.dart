import 'package:flutter/material.dart';

import 'client_information.dart';
import 'notes.dart';
import 'pet_information.dart';

class TicketInformationRightSideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F5FA),
          borderRadius: BorderRadius.circular(1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 16, top: 8,bottom:8),
              child: Text(
                'Client',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2D7CB6),
                  fontWeight: FontWeight.bold,
                ),
              )),
          TicketInformationClientDetailsView(),
          Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Pet',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2D7CB6),
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
              padding: EdgeInsets.all(8),
              child: TicketInformationPetInformation()),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: TicketInformationRightSideNotes())),
        ]));
  }
}
