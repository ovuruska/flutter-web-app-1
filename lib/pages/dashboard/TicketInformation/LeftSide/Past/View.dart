import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../../Controller.dart';
import 'CardList.dart';

class TicketInformationPastAppointmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: ticketInformationInputBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context)
  );

  Widget _build(BuildContext context){
    var appointments = ticketInformationInputBloc.value.priorAppointments.reversed.toList();

    return Column(
      children: [
        Expanded(child: TicketInformationPastCardList(
          appointments: appointments,
        )),
      ],
    );
  }
}
