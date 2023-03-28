import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';
import 'cards/Completed.dart';
import 'cards/InSession.dart';
import 'cards/InSessionPickUpReady.dart';
import 'cards/NewPet.dart';
import 'cards/NoShow.dart';
import 'cards/NoShowUnpaid.dart';
import 'cards/Pending.dart';
import 'cards/PendingSpecialHandling.dart';
import 'cards/Regular.dart';
import 'cards/SpecialHandling.dart';

class DashboardAppointmentCard extends StatelessWidget {
  final AppointmentEntity appointment;

  const DashboardAppointmentCard({Key? key, required this.appointment})
      : super(key: key);

  String getFormattedHourAndMinute(DateTime dateTime) {
    return DateFormat('h:mm a')
        .format(DateTime(2021, 1, 1, dateTime.hour, dateTime.minute));
  }

  onChanged(TimeOfDay timeOfDay) {
    var newDuration =
        Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
    var newAppointment = appointment.update(
      end: appointment.start.add(newDuration),
    );
    sidebarBloc.patchAppointment(newAppointment);
  }

  Widget build(BuildContext context) {
    var duration = appointment.end.difference(appointment.start);
    var height = duration.inMinutes / 15 * 31.5;
    var difference = appointment.end.difference(appointment.start);
    TimeOfDay appointmentDuration =
        TimeOfDay(hour: difference.inHours, minute: difference.inMinutes);
    if (appointment.status == AppointmentStatus.NO_SHOW) {
      return DashboardAppointmentCardNoShowUnpaid(
        appointment: appointment,
      );
    } else if(appointment.status == AppointmentStatus.PENDING){

      if(appointment.specialHandling){
        return DashboardAppointmentCardPendingSpecialHandling(
          appointment: appointment,
        );
      } else {
        return DashboardAppointmentCardPending(
          appointment: appointment,
        );
      }
    }else if (appointment.status == AppointmentStatus.COMPLETED) {
      return DashboardAppointmentCardCompleted(
        appointment: appointment,
      );
    } else if (appointment.status == AppointmentStatus.CLOSED_CHARGED) {
      return DashboardAppointmentCardNoShow(
        appointment: appointment,
      );
    } else if (appointment.status == AppointmentStatus.PICKUP_READY) {
      return DashboardAppointmentCardInSessionPickupReady(
        appointment: appointment,
      );
    } else if (appointment.status == AppointmentStatus.CHECKED_IN) {
      return DashboardAppointmentCardInSession(
        appointment: appointment,
      );
    } else if (appointment.status == AppointmentStatus.RESCHEDULING) {
      return Container();
    } else if (appointment.status == AppointmentStatus.CONFIRMED) {
      if (appointment.dog.specialHandling)
        return DashboardAppointmentCardSpecialHandling(
          appointment: appointment,
        );
      else if (appointment.lastDogAppointment == null)
        return DashboardAppointmentCardNewPet(
          appointment: appointment,
        );
      else
        return DashboardAppointmentCardRegular(
          appointment: appointment,
        );
    } else
      return Container();
  }
}
