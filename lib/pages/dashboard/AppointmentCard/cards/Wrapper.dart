


import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/common/dialogs.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import '../GestureDetector.dart';

class AppointmentCardWrapper extends StatelessWidget{

  final Appointment appointment;
  final Widget child;

  const AppointmentCardWrapper({Key? key, required this.appointment, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PendingAppointmentGestureDetector(
        appointment: appointment,
        child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: () => buildTicketInfoDialog(context, appointment),
    child:child));
  }



}