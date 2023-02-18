import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/AppointmentCard/Draggable.dart';
import '../../../sidebar/calendar/controller.dart';
import '../../../sidebar/controller.dart';
import '../../../constants.dart';
import '../../../controller.dart';
import '../../../repository.dart';
import 'controller.dart';

class SidebarCancelledAppointmentItem extends StatelessWidget {
  Appointment appointment;

  SidebarCancelledAppointmentItem({required this.appointment});

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
          (appointment.specialHandling)
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.star,
                    color: starColor,
                    size: 16,
                  ))
              : Container()
        ],
      ),
      subtitle: Text(
        '${formattedDate} | ${appointment.appointmentType}',
        style: FlutterFlowTheme.of(context).subtitle3,
      ),
      trailing: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF303030),
              size: 20,
            ),
            onTap: () {
              sidebarBloc.setBranch(appointment.branch);
              sidebarCalendarBloc.setDate(appointment.start);
              dashboardBloc.setService(appointment.appointmentType);

              dashboardBloc.setScrollUpdated();
              DashboardRepository.instance
                  .getDailyAppointments(appointment.branch, appointment.start)
                  .then((value) {
                if (value != null) dashboardBloc.setAppointments(value);
              });
            },
          )),
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
        sidebarCancelledAppointmentsBloc.removeAppointment(appointment);
      },
      childWhenDragging: Container(),
    );
  }
}
