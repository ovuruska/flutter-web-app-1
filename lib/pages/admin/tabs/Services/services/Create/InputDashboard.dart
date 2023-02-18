import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Services/services/Create/inputs/button/Button.dart';
import 'inputs/Description.dart';
import 'inputs/Duration.dart';
import 'inputs/Rate.dart';
import 'inputs/ServiceName.dart';
import 'inputs/button/Create.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ServicesCreateServiceNameInput(),
              ServicesCreateRateInput(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ServicesCreateDescriptionInput(),
              ServicesCreateDurationInput(),
            ],
          ),
          ServicesActionButton()
        ],
      )
    );

  }
}
