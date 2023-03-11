import 'package:flutter/material.dart';

import 'root/appointment_card.dart';
import 'root/entity.dart';

class AppointmentCardApproved extends StatelessWidget{

  final DashboardAppointmentEntity appointment;
  const AppointmentCardApproved({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      appointment: appointment,
      backgroundColor: const Color(0xFFFFFFFF),
      headerColor: const Color(0xFF3894D7),
    );
  }
}