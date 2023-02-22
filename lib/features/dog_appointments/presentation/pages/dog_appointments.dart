import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/presentation/widgets/upcoming_appointments.dart';

import '../../../../models/Appointment.dart';

class ViewDogAppointments extends StatelessWidget {
  final List<Appointment> upcomingAppointments;
  final List<Appointment> pastAppointments;

  const ViewDogAppointments(
      {Key? key,
      required this.upcomingAppointments,
      required this.pastAppointments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(
        tabs: [
          Tab(text: 'Upcoming'),
          Tab(text: 'Past'),
        ],
      ),
      TabBarView(
        children: [
          UpcomingAppointments(appointments: upcomingAppointments),
          UpcomingAppointments(appointments: pastAppointments)
        ],
      ),
    ]);
  }
}
