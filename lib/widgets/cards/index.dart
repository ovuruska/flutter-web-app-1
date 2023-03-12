import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'approved.dart';
import 'cancelled.dart';
import 'completed.dart';
import 'in_progress.dart';
import 'pending.dart';
import 'root/entity.dart';

class AppointmentCardFactory extends StatelessWidget {
  final DashboardAppointmentEntity appointment;

  const AppointmentCardFactory({Key? key, required this.appointment})
      : super(key: key);

  Widget _build(BuildContext context) {
    switch (appointment.status) {
      case "Confirmed":
        return AppointmentCardApproved(appointment: appointment);
      case "Cancelled":
        return AppointmentCardCancelled(appointment: appointment);
      case "Pending":
        return AppointmentCardPending(appointment: appointment);
      case "Completed":
        return AppointmentCardCompleted(appointment: appointment);
      case "CheckedIn":
      case "PickUpReady":
        return AppointmentCardInProgress(appointment: appointment);
      default:
        return Container();
    }
  }

  String prettyPrint(DashboardAppointmentEntity appointment) {
    // Jan 22, 2023 10:00 AM
    var formatter = new DateFormat('MMM dd, yyyy hh:mm a');
    return "Customer name: ${appointment.customerName}\nDog name: ${appointment.dogName}\nService:${appointment.service}\nStatus: ${appointment.status}\nStart: ${formatter.format(appointment.start)}\nEnd: ${formatter.format(appointment.end)}";
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(waitDuration:Duration(seconds:1),message: prettyPrint(appointment), child: _build(context));
  }
}
