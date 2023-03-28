import 'package:flutter/material.dart';

import 'button_group.dart';
import 'checkin_details.dart';
import 'price.dart';
import 'tip.dart';

class TicketInformationCheckinView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 128,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: TicketInformationCheckinDetails()),
            Padding(
                padding: EdgeInsets.all(16),
                child: TicketInformationCheckinPrice()),
            Padding(
                padding: EdgeInsets.all(8),
                child: TicketInformationCheckinTip()),
            Padding(
                padding: EdgeInsets.all(16),
                child: TicketInformationCheckinButtonGroup()),
          ],
        ));
  }
}
