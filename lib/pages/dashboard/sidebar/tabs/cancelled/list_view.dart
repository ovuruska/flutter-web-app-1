import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'item.dart';
import 'controller.dart';

class SidebarCancelledAppointmentList extends StatelessWidget {
  final List<Appointment> appointments;

  const SidebarCancelledAppointmentList({Key? key, required this.appointments}) : super(key: key);

  @override
  Widget build(BuildContext context){
    appointments.sort((a, b) => a.start.compareTo(b.start));
    return ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: appointments
            .map((e) => SidebarCancelledAppointmentItem(appointment: e))
            .toList());
  }
}
