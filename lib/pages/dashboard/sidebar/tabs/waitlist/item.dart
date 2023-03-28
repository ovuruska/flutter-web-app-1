import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/AppointmentCard/Draggable.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';
import 'controller.dart';

class SidebarReschedulingItem extends StatelessWidget {
  AppointmentEntity appointment;

  SidebarReschedulingItem({required this.appointment});

  Widget _build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy/MM/dd h:mm a').format(appointment.start);
    return ListTile(
      mouseCursor: SystemMouseCursors.grab,
      title: Row(
        children: [
          Text(
            appointment.customer.name,
            style: FlutterFlowTheme.of(context).title4,
          ),
          (appointment.specialHandling) ?
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child:Icon(
                Icons.star,
                color: starColor,
                size: 16,
              )
          ):Container()

        ],
      ),
      subtitle: Text(
        '${formattedDate} | ${appointment.appointmentType}',
        style: FlutterFlowTheme.of(context).subtitle3,
      ),
      tileColor: Color(0xFFF5F5F5),
      dense: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var draggedAppointment = appointment.update(
      status: AppointmentStatus.PENDING,
    );
    return Draggable(
      data: draggedAppointment,
      child: _build(context),
      hitTestBehavior: HitTestBehavior.translucent,
      ignoringFeedbackPointer: false,
      feedback: DashboardAppointmentCardDraggable(
        appointment: draggedAppointment,
      ),
      onDragCompleted: () {
        sidebarWaitlistBloc.removeAppointment(appointment);
      },
      childWhenDragging: Container(),
    );
  }
}
