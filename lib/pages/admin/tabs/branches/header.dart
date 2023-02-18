import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Employees/controller.dart';

import 'controller.dart';

class AdminBranchTabHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var currentIndex = adminEmployeeTabBloc.value.currentIndex;
    var employeeName = employeesBloc.value.employees[currentIndex].name;
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
            onPressed: () {
              adminEmployeeTabBloc.prevIndex();
            },
            icon: Icon(Icons.arrow_back)),
        Container(
            width: 200,
            child: Center(
              child: Text(
                employeeName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
        IconButton(
            onPressed: () {
              adminEmployeeTabBloc.nextIndex();
            },
            icon: Icon(Icons.arrow_forward)),
      ]),
    );
  }
}
