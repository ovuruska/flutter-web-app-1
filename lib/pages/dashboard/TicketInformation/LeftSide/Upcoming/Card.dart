import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import '../../utils.dart';


class TicketInformationUpcomingCard extends StatelessWidget {
  final Appointment appointment;

  Color textColor = const Color(0xFF2D7CB6);
  Color borderColor = const Color(0xFFD3D9E4);

  TicketInformationUpcomingCard({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var duration = appointment.end.difference(appointment.start);
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,

          border: Border.all(color: Color(0xFFD3D9E4), width: 1),
        ),
        child: Container(
            decoration: BoxDecoration(

                border: Border(
              left: BorderSide(
                color: Color(0xFFD4F0FF),
                width: 8,
              ),
            )),
            padding: EdgeInsets.fromLTRB(8, 4, 16, 4),
            child: IntrinsicHeight(
                child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 16),
                Text(
                  appointment.appointmentType,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textColor),
                ),
                divider(color: textColor),
                Text(formatDate(appointment.start),
                    style: TextStyle(color: textColor)),
                divider(color: textColor),
                Text(
                  DateFormat("h:mm a").format(appointment.start),
                  style: TextStyle(color: textColor),
                ),
                divider(color: textColor),
                Text(
                  "${duration.inMinutes} min",
                  style: TextStyle(color: textColor),
                ),
                divider(color: Color(0xFF787878)),
                Text(
                  "${appointment.employee.name}",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textColor),
                ),

                //
              ],
            ))));
  }
}
