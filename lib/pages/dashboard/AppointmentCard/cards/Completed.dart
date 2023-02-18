import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';

import 'AppointmentCard.dart';
import 'Wrapper.dart';

class DashboardAppointmentCardCompleted extends StatelessWidget {
  final Appointment appointment;

  DashboardAppointmentCardCompleted({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    const headerColor = Color(0xFF989898);
    const customerNameColor = Color(0xFF858585);
    const otherTextColor = Color(0xFF989898);
    const dogBreedColor = Color(0xFFC5C6C7);
    return AppointmentCardWrapper(
        appointment: appointment,
        child: AppointmentCard(
          headerBackgroundColor:headerColor,
          appointment: appointment,
          itemWidth: itemWidth,
          customerNameColor: customerNameColor,
          otherTextColor: otherTextColor,
          dogBreedColor: dogBreedColor,
        ));
  }
}
