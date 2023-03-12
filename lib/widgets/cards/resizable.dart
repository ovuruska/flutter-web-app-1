import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

class DashboardAppointmentCardResizable extends StatefulWidget {
  final Widget child;
  final double width;
  final Appointment appointment;

  const DashboardAppointmentCardResizable(
      {Key? key,
        required this.child,
        required this.width,
        required this.appointment})
      : super(key: key);

  @override
  _DashboardAppointmentCardResizableState createState() =>
      _DashboardAppointmentCardResizableState();
}

class _DashboardAppointmentCardResizableState
    extends State<DashboardAppointmentCardResizable> {
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

                      var newAppointment = widget.appointment.update(
                        start: widget.appointment.start.add(Duration(minutes: 15)),
                      );
                      if(newAppointment.start.isBefore(newAppointment.end.subtract(Duration(minutes: 14)))){
                        dashboardBloc.patchAppointmentLocal(newAppointment);
                      }
                    } else if (totalDrag < -quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.update(
                        start: widget.appointment.start.subtract(Duration(minutes: 15)),
                      );
                      dashboardBloc.patchAppointmentLocal(newAppointment);
                    }
                  },
                  onVerticalDragEnd: (details) {
                    AppointmentRepository.instance.patchAppointment(widget.appointment);
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
                  onVerticalDragStart: (details) {
                    dragging = true;
                  },
                  onVerticalDragUpdate: (details) {
                    totalDrag += details.delta.dy;

                    if (totalDrag > quarterHeight) {
                      totalDrag = 0;

                      var newAppointment = widget.appointment.update(
                        end: widget.appointment.end.add(Duration(minutes: 15)),
                      );
                      dashboardBloc.patchAppointmentLocal(newAppointment);


                    } else if (totalDrag < -quarterHeight) {
                      totalDrag = 0;
                      var newAppointment = widget.appointment.update(
                        end: widget.appointment.end.subtract(Duration(minutes: 15)),
                      );
                      if(newAppointment.start.isBefore(newAppointment.end.subtract(Duration(minutes: 14)))){
                        dashboardBloc.patchAppointmentLocal(newAppointment);
                      }
                    }
                  },
                  onVerticalDragEnd: (details) {
                    AppointmentRepository.instance.patchAppointment(widget.appointment);

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
