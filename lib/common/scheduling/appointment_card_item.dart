import 'package:flutter/material.dart';

import 'cards/index.dart';
import 'cards/wrapper.dart';
import 'models/scheduling_appointment_entity.dart';
import 'models/scheduling_appointment_layout.dart';
import 'resizable.dart';
import 'scheduling_context_provider.dart';

class SchedulingAppointmentCard extends StatelessWidget {
  final SchedulingAppointmentLayout layout;
  final int start;
  final DateTime date;
  final int employee;
  final Function(SchedulingAppointmentEntity)? onLocalUpdate;
  final Function(SchedulingAppointmentEntity)? onRemoteUpdate;
  final Function(DragTargetDetails<SchedulingAppointmentEntity>) Function(
      DateTime, int, int)? onAccept;

  const SchedulingAppointmentCard(
      {Key? key,
      required this.layout,
      required this.start,
      required this.date,
      required this.employee,
      this.onLocalUpdate,
      this.onRemoteUpdate,
      this.onAccept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appointment = layout.appointment;
    var topMost = DateTime(appointment.start.year, appointment.start.month,
        appointment.start.day, start, 0, 0);

    var schedulingContext = SchedulingContextProvider.of(context);

    var top = schedulingContext.headerHeight +
        appointment.start.difference(topMost).inMinutes *
            schedulingContext.boxHeight /
            60;

    var leftMargin = (layout.left) * schedulingContext.boxWidth;
    var width = (layout.right - layout.left) * schedulingContext.boxWidth -
        2 * schedulingContext.calendarMargin;

    return Positioned(
        key: ValueKey(appointment.id),
        top: top.toDouble(),
        left: leftMargin,
        child: DragTarget<SchedulingAppointmentEntity>(
            onAcceptWithDetails:
                onAccept == null ? null : onAccept!(date, start, employee),
            builder: (context, appointments, builder) {
              if (appointment.editable == false)
                return AppointmentCardFactory(
                  appointment: appointment,
                );
              else {
                return DragWrapper(
                    data: appointment,
                    child: SchedulingContextProvider(
                        schedulingContext: schedulingContext,
                        child: SchedulingResizableWrapper(
                            onLocalUpdate: onLocalUpdate,
                            onRemoteUpdate: onRemoteUpdate,
                            width: width,
                            appointment: appointment,
                            child: AppointmentCardFactory(
                              appointment: appointment,
                            ))));
              }
            }));
  }
}
