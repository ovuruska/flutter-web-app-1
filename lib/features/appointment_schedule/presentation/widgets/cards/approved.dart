import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/repositories/dashboard_appointment_entity.dart';

import 'root/appointment_card.dart';

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