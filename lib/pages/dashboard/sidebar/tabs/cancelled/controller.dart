

import 'package:scrubbers_employee_application/common/blocs/AppointmentList/Controller.dart';

import 'service.dart';

class SidebarCancelledAppointmentsBloc extends AppointmentListBloc {

   Future<void> fetch() async {
    var appointments = await DashboardCancelledService.instance.fetchAll();
    if (appointments != null) setAppointments(appointments);

  }
}

final sidebarCancelledAppointmentsBloc = SidebarCancelledAppointmentsBloc();