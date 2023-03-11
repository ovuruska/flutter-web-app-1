import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_appointment_entity.dart';

import 'root/appointment_card.dart';

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