import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';

import 'AppointmentCard.dart';
import 'Wrapper.dart';

class DashboardAppointmentCardPendingSpecialHandling extends StatelessWidget {
  final AppointmentEntity appointment;

  DashboardAppointmentCardPendingSpecialHandling({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    const headerColor = Color(0xFFE8F5FF);
    var headerLeadItem =  Padding(
        padding: const EdgeInsets.only(left: 2.0,right:2.0),
        child:Icon(
          Icons.star,
          color: starColor,
          size: 16,
        )
    );
    var headerTextColor = Colors.black;
    return AppointmentCardWrapper(
        appointment: appointment,
        child: AppointmentCard(
          headerTextColor: headerTextColor,
          headerBackgroundColor:headerColor,
          appointment: appointment,
          itemWidth: itemWidth,
          headerLeadItem: headerLeadItem,
        ));
  }
}
