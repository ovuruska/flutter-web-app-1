

import 'package:flutter/cupertino.dart';

import '../../../../../models/Appointment.dart';
import 'approved.dart';
import 'cancelled.dart';
import 'completed.dart';
import 'in_progress.dart';
import 'pending.dart';
import 'root/entity.dart';
import 'wrapper.dart';

class AppointmentCardFactory extends StatelessWidget{
  final DashboardAppointmentEntity appointment;

  const AppointmentCardFactory({Key? key, required this.appointment}) : super(key: key);

  Widget _build(BuildContext context) {
    switch(appointment.status){
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
  @override
  Widget build(BuildContext context) {
      return _build(context);
  }
}