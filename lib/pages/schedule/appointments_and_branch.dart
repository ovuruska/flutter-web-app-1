import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/information/appointment_tabs/presentation/pages/view_appointments.dart';

import '../../features/app_select_branch/presentation/pages/app_select_branch.dart';



class AppointmentsAndBranchView extends StatelessWidget {

  const AppointmentsAndBranchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          AppSelectBranchView(),
          Container(height: 16),
          Expanded(child: ViewAppointmentsPage())
        ]));
  }
}
