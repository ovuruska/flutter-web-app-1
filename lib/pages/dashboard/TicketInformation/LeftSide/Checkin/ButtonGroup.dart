import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/utils.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';




class TicketInformationCheckinButtonGroup extends StatelessWidget {

  closeTicket(AppointmentEntity appointment) {
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
