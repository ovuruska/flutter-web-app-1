

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/contants.dart';
import '../../appointment_context_provider.dart';



class CurrentAppointmentHeader extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;
    var duration = appointment.end.difference(appointment.start);
    return IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 16),
            Text(
              appointment.service,
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