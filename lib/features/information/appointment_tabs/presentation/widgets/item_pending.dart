import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/go_to.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../flutter_flow/flutter_flow_theme.dart';



class AppointmentItemPending extends StatelessWidget {
  SchedulingAppointmentEntity appointment;

  AppointmentItemPending({required this.appointment});

  Widget build(BuildContext context) {
    String formattedDate =
    DateFormat('yyyy/MM/dd h:mm a').format(appointment.start);
    return ListTile(
      mouseCursor: SystemMouseCursors.click,
      onTap: (){
        goTo(appointment);
      },
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

      tileColor: Color(0xFFF5F5F5),
      dense: false,
    );
  }

}
