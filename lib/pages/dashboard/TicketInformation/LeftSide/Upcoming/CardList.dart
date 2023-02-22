import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';

import 'Card.dart';

class TicketInformationUpcomingCardList extends StatelessWidget {
  final List<Appointment> appointments;

  TicketInformationUpcomingCardList({Key? key, required this.appointments})
      : super(key: key);
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: ticketInformationInputBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Color textColor = const Color(0xFF2D7CB6);
  Color borderColor = const Color(0xFFD3D9E4);

  Widget itemBuilder(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
        child: TicketInformationUpcomingCard(appointment: appointments[index]));
  }

  Widget _build(BuildContext context) {
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
