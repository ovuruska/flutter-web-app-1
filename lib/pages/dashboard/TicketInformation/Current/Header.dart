

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Controller.dart';
import '../utils.dart';



class CurrentAppointmentHeader extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    var duration = appointment.end.difference(appointment.start);
    return IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 16),
            Text(
              appointment.appointmentType,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF3894D7)),
            ),
            divider(),
            Text(formatDate(appointment.start)),
            divider(),
            Text(DateFormat("h:mm a").format(appointment.start)),
            divider(),
            Text("${duration.inMinutes} min"),
            divider(),
            Text(
              "${appointment.employee.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //
          ],
        ));
  }


}