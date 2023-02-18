

import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import '../controller.dart';
import 'item.dart';

class AdminEmployeeTabResults extends StatelessWidget{
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(stream: adminEmployeeTabBloc.stream, listener: (value){}, builder: (context, value) => _build(context));
  Widget _build(BuildContext context) {
    var currentEmployee = adminEmployeeTabBloc.getCurrent();
    int index = 0;

    return SingleChildScrollView(
        child:ListView(
          shrinkWrap: true,
          children: adminEmployeeTabBloc.getQueryResults().map((employee) => AdminEmployeeTabListItem(
              onClick: (index) =>    adminEmployeeTabBloc.setCurrentIndex(index),
              employee:employee,index:index++,selected: employee.id == currentEmployee?.id)).toList(),
        )

    );
  }
}