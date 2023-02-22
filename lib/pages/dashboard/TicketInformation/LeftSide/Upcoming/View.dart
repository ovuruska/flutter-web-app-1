import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';

import 'Card.dart';
import 'CardList.dart';
import 'Checkin/View.dart';

class TicketInformationUpcomingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: ticketInformationInputBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Color textColor = const Color(0xFF2D7CB6);
  Color borderColor = const Color(0xFFD3D9E4);

  Widget _build(BuildContext context) {
    var appointments = ticketInformationInputBloc.value.upcomingAppointments;

    return Column(
      children: [
        Expanded(child: TicketInformationUpcomingCardList(appointments: appointments)),
        Divider(color: Color(0xFFD9D9D9), height: 1,indent:16,endIndent: 16,),
      ],
    );
  }
}
