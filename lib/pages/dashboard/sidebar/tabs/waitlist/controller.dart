import 'package:scrubbers_employee_application/common/blocs/AppointmentList/Controller.dart';

import 'service.dart';

class SidebarWaitlistBloc extends AppointmentListBloc{
  Future<void> fetch() async {
    var appointments = await DashboardWaitlistService.instance.fetchAll();
    if (appointments != null) setAppointments(appointments);
  }
}

final sidebarWaitlistBloc = SidebarWaitlistBloc();