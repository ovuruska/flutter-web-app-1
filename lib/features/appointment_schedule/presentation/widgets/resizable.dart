import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../../../widgets/cards/root/entity.dart';
import '../../utils/constants.dart';

class AppointmentScheduleResizableWrapper extends StatefulWidget {
  final Widget child;
  final double width;
  final DashboardAppointmentEntity appointment;
  final Function(DashboardAppointmentEntity) onLocalUpdate;
  final Function(DashboardAppointmentEntity) onRemoteUpdate;

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
                        widget.onLocalUpdate(newAppointment);

                      }
                    } else if (totalDrag < -quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.copyWith(
                        start: widget.appointment.start
                            .subtract(Duration(minutes: 15)),
                      );
                      widget.onLocalUpdate(newAppointment);
                    }
                  },
                  onVerticalDragEnd: (details) {
                    totalDrag = 0;
                    widget.onRemoteUpdate(widget.appointment);
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
                      widget.onLocalUpdate(newAppointment);
                    } else if (totalDrag < -quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.copyWith(
                        end: widget.appointment.end
                            .subtract(Duration(minutes: 15)),
                      );
                      if (newAppointment.start.isBefore(
                          newAppointment.end.subtract(Duration(minutes: 14)))) {
                        widget.onLocalUpdate(newAppointment);
                      }
                    } else if (totalDrag < -quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.copyWith(
                        end: widget.appointment.end
                            .subtract(Duration(minutes: 15)),
                      );
                      if (newAppointment.start.isBefore(
                          newAppointment.end.subtract(Duration(minutes: 14)))) {
                        widget.onLocalUpdate(newAppointment);
                      }
                    }
                  },
                  onVerticalDragEnd: (details) {
                    totalDrag = 0;
                    widget.onRemoteUpdate(widget.appointment);
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
