import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class TicketInformationRightButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getStyledButton(text: "Notify", width: 96, fontSize: 14),
        getStyledButton(text: "Message", width: 96, fontSize: 14),
        getStyledButton(text: "No Show", width: 96, fontSize: 14),
      ],
    ));
  }
}
