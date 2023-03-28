import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';

import 'AppointmentCard.dart';
import 'Wrapper.dart';

class DashboardAppointmentCardPending extends StatelessWidget {
  final AppointmentEntity appointment;

  DashboardAppointmentCardPending({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    const headerColor = Color(0xFFE8F5FF);
    var headerTextColor = Colors.black;
    return AppointmentCardWrapper(
        appointment: appointment,
        child: AppointmentCard(
          headerTextColor:headerTextColor,
          headerBackgroundColor:headerColor,
          appointment: appointment,
          itemWidth: itemWidth,
        ));
  }
}
