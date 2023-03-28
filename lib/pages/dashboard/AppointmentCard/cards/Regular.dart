import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';

import 'AppointmentCard.dart';
import 'Wrapper.dart';

class DashboardAppointmentCardRegular extends StatelessWidget {
  final AppointmentEntity appointment;

  DashboardAppointmentCardRegular({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    const headerColor = Color(0xFF3894D7);
    return AppointmentCardWrapper(
        appointment: appointment,
        child: AppointmentCard(
          headerBackgroundColor:headerColor,
          appointment: appointment,
          itemWidth: itemWidth,
        ));
  }
}
