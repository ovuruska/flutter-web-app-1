import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/scheduling_appointment_entity.dart';
import 'scheduling_context_provider.dart';

class AppointmentScheduleResizableWrapper extends StatefulWidget {
  final Widget child;
  final double width;
  final SchedulingAppointmentEntity appointment;
  final Function(SchedulingAppointmentEntity)? onLocalUpdate;
  final Function(SchedulingAppointmentEntity)? onRemoteUpdate;

  const AppointmentScheduleResizableWrapper(
      {Key? key,
        required this.child,
        required this.width,
        required this.appointment, required this.onLocalUpdate, required this.onRemoteUpdate})
      : super(key: key);

  @override
  _AppointmentScheduleResizableWrapperState createState() =>
      _AppointmentScheduleResizableWrapperState();
}

class _AppointmentScheduleResizableWrapperState
    extends State<AppointmentScheduleResizableWrapper> {
  double totalDrag = 0;
  bool dragging = false;


  @override
  Widget build(BuildContext context) {
    var schedulingContext = SchedulingContextProvider.of(context);
    var quarterHeight = schedulingContext.boxHeight / 4;
    return Stack(
      children: [
        widget.child,
        Positioned(
          child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onVerticalDragUpdate: (details) {
                    totalDrag += details.delta.dy;

                    if (totalDrag > quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.copyWith(
                        start:
                        widget.appointment.start.add(Duration(minutes: 15)),
                      );
                      if (newAppointment.start.isBefore(
                          newAppointment.end.subtract(Duration(minutes: 14)))) {
                        if(widget.onLocalUpdate != null) widget.onLocalUpdate!(newAppointment);

                      }
                    } else if (totalDrag < -quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.copyWith(
                        start: widget.appointment.start
                            .subtract(Duration(minutes: 15)),
                      );
                      if(widget.onLocalUpdate != null) widget.onLocalUpdate!(newAppointment);
                    }
                  },
                  onVerticalDragEnd: (details) {
                    totalDrag = 0;
                    if(widget.onRemoteUpdate != null) widget.onRemoteUpdate!(widget.appointment);
                  },
                  child: Container(
                    width: widget.width,
                    height: 16,
                  ))),
          top: 0,
          left: 0,
          width: widget.width,
        ),
        Positioned(
          child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onVerticalDragUpdate: (details) {
                    totalDrag += details.delta.dy;

                    if (totalDrag > quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.copyWith(
                        end: widget.appointment.end.add(Duration(minutes: 15)),
                      );
                      if(widget.onLocalUpdate != null) widget.onLocalUpdate!(newAppointment);
                    } else if (totalDrag < -quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.copyWith(
                        end: widget.appointment.end
                            .subtract(Duration(minutes: 15)),
                      );
                      if (newAppointment.start.isBefore(
                          newAppointment.end.subtract(Duration(minutes: 14)))) {
                        if(widget.onLocalUpdate != null) widget.onLocalUpdate!(newAppointment);
                      }
                    } else if (totalDrag < -quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.copyWith(
                        end: widget.appointment.end
                            .subtract(Duration(minutes: 15)),
                      );
                      if (newAppointment.start.isBefore(
                          newAppointment.end.subtract(Duration(minutes: 14)))) {
                        if(widget.onLocalUpdate != null) widget.onLocalUpdate!(newAppointment);
                      }
                    }
                  },
                  onVerticalDragEnd: (details) {
                    totalDrag = 0;
                    if(widget.onRemoteUpdate != null) widget.onRemoteUpdate!(widget.appointment);
                  },
                  child: Container(
                    width: widget.width,
                    height: 16,
                  ))),
          bottom: 0,
          left: 0,
          width: widget.width,
        ),
      ],
    );
  }
}
