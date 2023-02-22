import 'package:flutter/material.dart';

import '../../../../models/Appointment.dart';

class ViewDogAppointments extends StatelessWidget {
  final List<Appointment> upcomingAppointments;
  final List<Appointment> pastAppointments;

  const ViewDogAppointments({Key? key, required this.upcomingAppointments, required this.pastAppointments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('View Dog Appointments'),
      ),
    );
  }
}
