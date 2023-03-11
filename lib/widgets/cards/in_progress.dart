import 'package:flutter/material.dart';

import 'root/appointment_card.dart';
import 'root/entity.dart';

class AppointmentCardInProgress extends StatelessWidget{

  final DashboardAppointmentEntity appointment;
  const AppointmentCardInProgress({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      appointment: appointment,
      backgroundColor: const Color(0xFFFBFDF7),
      headerColor: const Color(0xFFB1C97F),
    );
  }
}