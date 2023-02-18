

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/header.dart';

class NotificationsView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Expanded(
        child:Column(
          children: [
            Header(),
            Expanded(
              child: Center(
                child: Text("Notifications"),
              ),
            )
          ],
        )
      )
    );
  }
}