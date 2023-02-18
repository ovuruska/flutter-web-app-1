import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/header.dart';

import 'Form.dart';

class AdminLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Header(),
          Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AdminLoginForm()
                  ]))
        ],
      )),
    );
  }
}
