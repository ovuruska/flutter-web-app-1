import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/repository.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/View.dart';
import 'package:scrubbers_employee_application/repositories/customer.dart';

Future<void> buildTicketInfoDialog(
    BuildContext context, Appointment? appointment) async {
  if (appointment == null)
    ticketInformationInputBloc.setAppointment(null);
  else {
    var customerId = appointment.customer.id;
    CustomerRepository.instance.getCustomerDetails(int.parse(customerId)).then(
        (customerDetails) =>
            ticketInformationInputBloc.setCustomerDetails(customerDetails));
    ticketInformationInputBloc.setAppointment(appointment.clone());

    DashboardRepository.instance.getUpcomingAppointments(appointment.dog).then(
        (appointments) =>
            ticketInformationInputBloc.setUpcomingAppointments(appointments!));
    DashboardRepository.instance.getPriorAppointments(appointment.dog).then(
        (appointments) =>
            ticketInformationInputBloc.setPriorAppointments(appointments!));
  }

  return showDialog(
    context: context,
    builder: (context) {
      return DashboardTicketInformationView();
    },
  );
}
