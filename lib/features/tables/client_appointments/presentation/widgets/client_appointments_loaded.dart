import 'package:flutter/material.dart';

import '../../domain/entity/appointment_details.dart';
import 'client_appointments_table.dart';

class ClientAppointmentsLoaded extends StatelessWidget {
  final List<AppointmentDetails> appointments;

  const ClientAppointmentsLoaded({Key? key, required this.appointments})
      : super(key: key);

  Widget build(BuildContext context) {
    appointments.sort((a, b) => a.start.compareTo(b.start));
    var pastAppointments = appointments.where((element) => element.start.isBefore(DateTime.now())).toList();
    var upcomingAppointments = appointments.where((element) => element.start.isAfter(DateTime.now())).toList();
    return DefaultTabController(
        length:2,
        child:Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: "Past appointments"),
              Tab(text: "Upcoming appointments"),
            ],
          ),
        ),
        body:TabBarView(
          children:[
            ClientAppointmentsTable(appointments: pastAppointments),
            ClientAppointmentsTable(appointments: upcomingAppointments),
])
    ));
  }
}
