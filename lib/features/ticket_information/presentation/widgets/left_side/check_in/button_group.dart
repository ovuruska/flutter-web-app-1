import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';

import '../../../../utils/style.dart';




class TicketInformationCheckinButtonGroup extends StatelessWidget {

  closeTicket(AppointmentEntity appointment) {
    // TODO: Close ticket
  }

  @override
  Widget build(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getStyledButton(
            text: "Close Ticket",
            onPressed: () {

              closeTicket(appointment);
            }),
        getStyledButton(
            text: "Close & Rebook",
            onPressed: () {
              closeTicket(appointment);
              // TODO: Go to rebook
            }),
        getStyledButton(

            text: "Save Changes",
            onPressed: () {

              // TODO Save changes
            }),

      ],
    );
  }
}
