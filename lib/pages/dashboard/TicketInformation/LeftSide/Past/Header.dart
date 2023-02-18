import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';

import '../../utils.dart';


class PastAppointmentHeader extends StatelessWidget {
  final Appointment appointment;

  const PastAppointmentHeader({Key? key, required this.appointment}) : super(key: key);


  String getDifference(DateTime date) {
    var now = DateTime.now();
    var difference = now.difference(date);
    var days = difference.inDays;
    var months = difference.inDays ~/ 30;
    var years = difference.inDays ~/ 365;
    var weeks = difference.inDays ~/ 7;

    if (days < 10) {
      return "$days days ago";
    } else if (weeks < 10) {
      return "$weeks weeks ago";
    } else if (months < 12) {
      return "$months months ago";
    } else {
      return "$years years ago";
    }
  }

  Widget build(BuildContext context) {
    var duration = appointment.end.difference(appointment.start);
    return IntrinsicHeight(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(width: 16),
        Text(
          appointment.appointmentType,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF787878)),
        ),
        divider(color: Color(0xFF787878)),
        Text(formatDate(appointment.start)),
        divider(color: Color(0xFF787878)),
        Text(
          DateFormat("h:mm a").format(appointment.start),
          style: TextStyle(color: Color(0xFF787878)),
        ),
        divider(color: Color(0xFF787878)),
        Text(
          "${duration.inMinutes} min",
          style: TextStyle(color: Color(0xFF787878)),
        ),
        divider(color: Color(0xFF787878)),
        Text(
          "${appointment.employee.name}",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF787878)),
        ),
        divider(color: Color(0xFF787878)),
        Text(
          getDifference(appointment.start),
          style: TextStyle(color: Color(0xFF787878)),
        ),

        //
      ],
    ));
    ;
  }


}
