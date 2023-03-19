

import 'package:flutter/material.dart';

import 'root/appointment_card.dart';
import '../models/scheduling_appointment_entity.dart';

class AppointmentCardCompleted extends StatelessWidget{

  final SchedulingAppointmentEntity appointment;
  const AppointmentCardCompleted({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      appointment: appointment,
      backgroundColor: const Color(0xFFFFFFFF),
      headerColor: const Color(0xFFE5E5E5),
    );
  }
}