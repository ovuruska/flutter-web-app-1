

import 'package:scrubbers_employee_application/common/blocs/AppointmentList/Controller.dart';

import 'service.dart';

class SidebarPendingAppointmentsBloc extends AppointmentListBloc {
  Future<void> fetch() async {
    var appointments = await AwaitingAppointmentsService.instance.fetchAll();
    if (appointments != null) setAppointments(appointments);
  }
}

final sidebarPendingAppointmentsBloc = SidebarPendingAppointmentsBloc();