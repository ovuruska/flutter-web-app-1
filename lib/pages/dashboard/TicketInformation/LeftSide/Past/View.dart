import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import 'CardList.dart';

class TicketInformationPastAppointmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: TicketInformationPastCardList()),
      ],
    );
  }
}
