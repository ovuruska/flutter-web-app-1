import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';

import 'card.dart';

class TicketInformationPastCardList extends StatelessWidget {
  final List<AppointmentEntity> appointments;

  TicketInformationPastCardList({Key? key, required this.appointments})
      : super(key: key);

  Color textColor = const Color(0xFF2D7CB6);
  Color borderColor = const Color(0xFFD3D9E4);

  Widget itemBuilder(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
        child: TicketInformationPastCard(appointment: appointments[index]));
  }

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty)
      return Center(
        child: Text(
          "No past appointments",
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
