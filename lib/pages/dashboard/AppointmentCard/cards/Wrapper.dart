import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/common/dialogs.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import '../GestureDetector.dart';

class ContextMenuUseCase {
  final String text;
  final Function(Appointment) callback;
  final Color color;

  ContextMenuUseCase({
    required this.text,
    required this.callback,
    required this.color,
  });
}

class AppointmentCardWrapper extends StatelessWidget {
  final Appointment appointment;
  final Widget child;
  final bool draggable;
  final bool editable;
  final List<ContextMenuUseCase> contextMenuUseCases;

  const AppointmentCardWrapper(
      {Key? key,
      required this.appointment,
      required this.child,
      this.draggable = true,
      this.editable = true,
      this.contextMenuUseCases = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PendingAppointmentGestureDetector(
        appointment: appointment,
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onDoubleTap: () => buildTicketInfoDialog(context, appointment),
            child: child));
  }
}
