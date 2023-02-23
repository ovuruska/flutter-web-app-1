import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/AppointmentCard/GestureDetector.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/DailySchedule/Bloc.dart';
import 'package:scrubbers_employee_application/pages/dashboard/repository.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

import '../../../sidebar/calendar/controller.dart';
import '../../controller.dart';


class SidebarAppointmentItem extends StatelessWidget {
  Appointment appointment;

  SidebarAppointmentItem({required this.appointment,Key ? key}) : super(key: key);

  double getTopOffset(TimeOfDay timeOfDay) {
    var hour = timeOfDay.hour;
    var minute = timeOfDay.minute;
    return hour * hourColumnHeight + minute / 60 * hourColumnHeight - topOffset;
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy/MM/dd h:mm a').format(appointment.start);
    return PendingAppointmentGestureDetector(
        appointment: appointment,
        child: ListTile(
          title: Row(children: [
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
          ]),
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

                  var topOffset =
                      getTopOffset(TimeOfDay.fromDateTime(appointment.start.subtract(Duration(hours:startHour))));
                  dashboardDailyScheduleBloc.setScrollY(topOffset);
                  dashboardBloc.setScrollUpdated();
                  DashboardRepository.instance
                      .getDailyAppointments(appointment.branch, appointment.start)
                      .then((value) {
                    if (value != null) dashboardBloc.setAppointments(value);
                  });

                  var currentRoute = GoRouter.of(context).location;
                },
              )),
          tileColor: Color(0xFFF5F5F5),
          dense: false,
        ));
  }
}
