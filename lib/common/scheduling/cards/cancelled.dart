

import 'package:flutter/material.dart';

import 'root/appointment_card.dart';
import '../models/scheduling_appointment_entity.dart';

class AppointmentCardCancelled extends StatelessWidget{

  final SchedulingAppointmentEntity appointment;
  const AppointmentCardCancelled({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      appointment: appointment,
      backgroundColor: const Color(0xFFFFF4F4),
      headerColor: const Color(0xFFFF5B5B),
    );
  }
}