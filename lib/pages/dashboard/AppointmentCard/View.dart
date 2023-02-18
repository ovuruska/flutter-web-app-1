import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/dialogs.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import '../utils.dart';
import 'Draggable.dart';
import 'Resizable.dart';

class DashboardAppointmentCardDragTarget extends StatelessWidget {
  final Appointment appointment;
  final double width;
  final Function (DragTargetDetails<Appointment>) dragFunction;

  const DashboardAppointmentCardDragTarget(
      {Key? key, required this.appointment, required this.dragFunction, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () => buildTicketInfoDialog(context, appointment),
        child: DragTarget<Appointment>(
            onAcceptWithDetails: dragFunction,
            builder: (context, appointments, builder) =>
                DashboardAppointmentCardResizable(
                    width: width,
                    appointment: appointment,
                    child: DashboardAppointmentCardDraggable(
                      appointment: appointment,
                    ))));
  }
}
