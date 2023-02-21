import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';

class TicketInformationSpecialHandling extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: ticketInformationInputBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    var petId = appointment.dog.id;
    return Container(
        child: Row(
      children: [
        Text("Special Handling:",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        Container(width: 8),
        Row(
          children: [
            Text(
              "No",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Checkbox(
                activeColor: Colors.green,
                value: !appointment.specialHandling,
                onChanged: (value) =>
                    ticketInformationInputBloc.setSpecialHandling(petId,value ?? false))
          ],
        ),
      ],
    ));
  }
}
