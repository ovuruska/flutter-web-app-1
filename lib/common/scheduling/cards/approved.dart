import 'package:flutter/material.dart';

import 'root/appointment_card.dart';
import '../models/scheduling_appointment_entity.dart';

class AppointmentCardApproved extends StatelessWidget{

  final SchedulingAppointmentEntity appointment;
  const AppointmentCardApproved({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      appointment: appointment,
      backgroundColor: const Color(0xFFEBF4FB),
      headerColor: const Color(0xFF3894D7),
    );
  }
}