import 'package:flutter/material.dart';

import '../../../../models/Appointment.dart';
import '../../domain/constants.dart';
import 'upcoming_card.dart';

class UpcomingAppointments extends StatelessWidget {
  final List<Appointment> appointments;
  UpcomingAppointments({
    Key? key,
    required this.appointments,
  }) : super(key: key);

  Widget itemBuilder(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
        child: UpcomingCard(appointment: appointments[index]));
  }

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty)
      return Center(
        child: Text(
          "No upcoming appointments",
          style: TextStyle(color: textColor),
        ),
      );
    else
      return SingleChildScrollView(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) => itemBuilder(context, index),
            itemCount: appointments.length,
          ));
  }
}
