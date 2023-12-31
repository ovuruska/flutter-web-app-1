import 'package:flutter/material.dart';

import '../../../../../../core/domain/entities/appointment.dart';
import 'card.dart';


class TicketInformationUpcomingCardList extends StatelessWidget {
  final List<AppointmentEntity> appointments;

  TicketInformationUpcomingCardList({Key? key, required this.appointments})
      : super(key: key);
  @override
  Widget build(BuildContext context){
    if (appointments.isEmpty)
      return Center(
        child: Text(
          "No upcoming appointments",
          style: TextStyle(color: textColor),
        ),
      );
    else
      return Container(
          margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
          child:SingleChildScrollView(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => itemBuilder(context, index),
                itemCount: appointments.length,
              )));
  }
  Color textColor = const Color(0xFF2D7CB6);
  Color borderColor = const Color(0xFFD3D9E4);

  Widget itemBuilder(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
        child: TicketInformationUpcomingCard(appointment: appointments[index]));
  }

}
