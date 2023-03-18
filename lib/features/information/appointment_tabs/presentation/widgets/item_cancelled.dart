import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import '../../../../../widgets/cards/root/entity.dart';



class AppointmentItemCancelled extends StatelessWidget {
  DashboardAppointmentEntity appointment;

  AppointmentItemCancelled({required this.appointment});

  Widget build(BuildContext context) {
    String formattedDate =
    DateFormat('yyyy/MM/dd h:mm a').format(appointment.start);
    return ListTile(
      mouseCursor: SystemMouseCursors.grab,
      title: Row(
        children: [
          Text(
            appointment.customerName,
            style: FlutterFlowTheme.of(context).title4,
          ),
          (appointment.specialHandling)
              ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.star,
                color: const Color(0xFFFF5B5B),
                size: 16,
              ))
              : Container()
        ],
      ),
      subtitle: Text(
        '${formattedDate} | ${appointment.service}',
        style: FlutterFlowTheme.of(context).subtitle3,
      ),
      trailing: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF303030),
              size: 20,
            ),
            onTap: () {

            },
          )),
      tileColor: Color(0xFFF5F5F5),
      dense: false,
    );
  }

}
