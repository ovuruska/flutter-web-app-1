import 'package:flutter/material.dart';

import 'root/appointment_card.dart';
import '../models/scheduling_appointment_entity.dart';

class AppointmentCardPending extends StatelessWidget{

  final SchedulingAppointmentEntity appointment;
  const AppointmentCardPending({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      appointment: appointment,
      backgroundColor: const Color(0xFFFCF9FF),
      headerColor: const Color(0xFFAB87C8),
    );
  }
}