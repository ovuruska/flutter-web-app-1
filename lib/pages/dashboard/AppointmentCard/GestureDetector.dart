import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

import '../controller.dart';
import '../sidebar/tabs/pending/controller.dart';
import 'showContextMenu.dart';

class PendingAppointmentGestureDetector extends StatelessWidget {
  AppointmentEntity appointment;
  Widget child;

  PendingAppointmentGestureDetector(
      {required this.child, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onSecondaryTapDown: (details) {
          if (appointment.status == AppointmentStatus.PENDING)
            showContextMenu(
                context,
                details,
                onTapApprove: () {
                  var newAppointment =
                      appointment.update(status: AppointmentStatus.CONFIRMED);
                  AppointmentRepository.instance.patchAppointment(newAppointment);
                  dashboardBloc.patchAppointment(newAppointment);
                  sidebarPendingAppointmentsBloc.removeAppointment(appointment);
                },
                onTapCancel: () {
                  var newAppointment =
                      appointment.update(status: AppointmentStatus.CANCELLED);
                  AppointmentRepository.instance.patchAppointment(newAppointment);
                  dashboardBloc.removeAppointment(newAppointment);
                  sidebarPendingAppointmentsBloc.removeAppointment(appointment);
            });
        },
        child: child);
  }
}
