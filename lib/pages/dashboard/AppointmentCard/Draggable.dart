import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import 'Card.dart';

class DashboardAppointmentCardDraggable extends StatelessWidget {
  final AppointmentEntity appointment;

  const DashboardAppointmentCardDraggable({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: MouseRegion(
          opaque: false,
          cursor: SystemMouseCursors.grab,
          child:
          DashboardAppointmentCard(appointment: appointment)),
      hitTestBehavior: HitTestBehavior.translucent,
      data: appointment,
      ignoringFeedbackPointer: false,
      feedback: MouseRegion(
          opaque: false,

          cursor: SystemMouseCursors.grabbing,
          child:
          DashboardAppointmentCard(appointment: appointment)),
      childWhenDragging: Container(),
    );
  }
}
