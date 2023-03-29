import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/ticket_information/utils/show_ticket_information_dialog.dart';

import '../models/scheduling_appointment_entity.dart';

class DragWrapper extends StatelessWidget {

  final Widget child;
  final SchedulingAppointmentEntity data;

  const DragWrapper({Key? key, required this.child, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () {
          showTicketInformationDialog(context, data.id);
        },
        child:MouseRegion(
      cursor: SystemMouseCursors.grab,
        child:Draggable<SchedulingAppointmentEntity>(
      child: child,
      data:data,
      feedback: Opacity(opacity: .5, child: child),
      childWhenDragging: Container()),
    ));
  }
}