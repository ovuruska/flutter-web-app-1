import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/appointments/Search/inputs/SelectAppointmentDate.dart';
import 'package:scrubbers_employee_application/pages/appointments/Search/inputs/SelectAppointmentStatus.dart';
import 'package:scrubbers_employee_application/pages/appointments/Search/inputs/SelectBranch.dart';

import 'inputs/SearchInputField.dart';
import 'inputs/SelectEmployee.dart';
import 'inputs/SelectServiceType.dart';
import 'inputs/SubmitButton.dart';

class AppointmentSearchInputDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 300),
      width: MediaQuery.of(context).size.width*.2,
      height: MediaQuery.of(context).size.height ,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: EdgeInsets.all(8),
              child: AppointmentsSearchInputsSearchField()),
          Padding(
              padding: EdgeInsets.all(8),
              child: AppointmentsSearchSelectBranch()),
          Padding(
              padding: EdgeInsets.all(8),
              child: AppointmentsSearchSelectAppointmentDate()),
          Padding(
              padding: EdgeInsets.all(8),
              child: AppointmentsSearchSelectServiceType()),
          Padding(
              padding: EdgeInsets.all(8),
              child: AppointmentsSearchSelectEmployee()),
          Padding(
              padding: EdgeInsets.all(8),
              child: AppointmentsSearchSelectAppointmentStatus()),
          AppointmentsSearchSubmitButton()
        ],
      )
    );

  }
}
