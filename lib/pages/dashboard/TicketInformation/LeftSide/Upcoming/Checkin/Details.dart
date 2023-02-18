import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/DateWithCheckbox.dart';

import 'utils.dart';

class TicketInformationCheckinDetails extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    return Row(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getText(text: "Check-in"),
              getText(text: "Pick-up ready"),
              getText(text: "Check-out"),
            ]),
      ),
      Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
        DateWithCheckbox(
            date: appointment.checkIn,
            onChanged: ticketInformationInputBloc.setCheckIn),
        DateWithCheckbox(
            date: appointment.pickUp,
            onChanged: ticketInformationInputBloc.setPickUp),
        DateWithCheckbox(
            date: appointment.checkoutTime,
            onChanged: ticketInformationInputBloc.setCheckout),
      ])
    ]);
  }
}
