import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';

import 'AppointmentCard.dart';
import 'Wrapper.dart';

class DashboardAppointmentCardInSessionPickupReady extends StatelessWidget {
  final Appointment appointment;

  DashboardAppointmentCardInSessionPickupReady({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    const headerColor = Color(0xFF4CA336);
    return AppointmentCardWrapper(
        appointment: appointment,
        child: AppointmentCard(
          headerBackgroundColor:headerColor,
          appointment: appointment,
          itemWidth: itemWidth,
          customerRowTailItem: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'READY',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: headerColor,
                  fontSize: 12,
                ),
              ),
              Padding(
                padding:EdgeInsets.only(bottom:6,left:2),
                child:  Text("🚗"),

              )

            ],
          ),
        ));
  }
}
