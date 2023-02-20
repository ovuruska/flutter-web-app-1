

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../../controller.dart';
import 'LeftColumn.dart';
import 'LeftColumnEditable.dart';

class AdminEmployeeTabEmployeeRowLeftColumnView extends StatelessWidget{
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminEmployeeTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));



  Widget _build(BuildContext context) {
    var editable = adminEmployeeTabBloc.value.editable;
    if(editable){
      return AdminEmployeeTabEmployeeRowLeftColumnEditable();
    }else{
      return AdminEmployeeTabEmployeeRowLeftColumn();
    }

  }
}