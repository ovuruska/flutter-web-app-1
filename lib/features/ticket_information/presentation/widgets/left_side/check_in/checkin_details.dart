import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';
import 'package:scrubbers_employee_application/widgets/inputs/DateWithCheckbox.dart';

import 'utils.dart';

class TicketInformationCheckinDetails extends StatelessWidget {

  setCheckIn(DateTime? date) {

  }

  setPickUp(DateTime? date) {

  }

  setCheckout(DateTime? date) {

  }


  @override
  Widget build(BuildContext context){
    var appointment = AppointmentContextProvider.of(context).appointment;
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
            onChanged: setCheckIn),
        DateWithCheckbox(
            disabled : appointment.checkIn == null,
            date: appointment.pickUp,
            onChanged: setPickUp),
        DateWithCheckbox(
            disabled : appointment.pickUp == null,
            date: appointment.checkoutTime,
            onChanged: setCheckout),
      ])
    ]);
  }
}
