import 'package:flutter/material.dart';

import '../models/scheduling_appointment_entity.dart';

class DragWrapper extends StatelessWidget {

  final Widget child;
  final SchedulingAppointmentEntity data;

  const DragWrapper({Key? key, required this.child, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<SchedulingAppointmentEntity>(
      child: child,
      data:data,
      feedback: Opacity(opacity: .5, child: child),
      childWhenDragging: Container(),
    );
  }
}