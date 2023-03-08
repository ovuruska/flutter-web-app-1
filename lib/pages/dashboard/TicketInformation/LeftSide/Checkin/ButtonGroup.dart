import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/utils.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

import '../../../../../features/create_appointment/presentation/pages/create_appointment_dialog.dart';
import '../../../../../features/rebook_appointment/presentation/pages/rebook_appointment_dialog.dart';


class TicketInformationCheckinButtonGroup extends StatelessWidget {

  closeTicket(Appointment appointment) {
    var newAppointment =
        appointment.update(status: AppointmentStatus.COMPLETED);
    ticketInformationInputBloc.setAppointment(newAppointment);
    dashboardBloc.patchAppointment(newAppointment);
    AppointmentRepository.instance.patchAppointment(newAppointment);
  }

  @override
  Widget build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
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
              showDialog(context: context, builder: (context)=>RebookAppointmentDialog(
                petId: appointment.dog.id,
                customerId: int.parse(appointment.customer.id),
              ));
            }),
        getStyledButton(

            text: "Save Changes",
            onPressed: () {
              dashboardBloc.patchAppointment(appointment);
              AppointmentRepository.instance.patchAppointment(appointment);
            }),

      ],
    );
  }
}
