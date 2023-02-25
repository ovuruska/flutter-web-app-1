

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../../controller.dart';
import 'column.dart';
import 'column_editable.dart';

class AdminBranchesTabInformationRowLeftColumnView extends StatelessWidget{
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));



  Widget _build(BuildContext context) {
    var editable = adminBranchesTabBloc.value.editable;
    if(editable){
      return AdminBranchesTabInformationRowLeftColumnEditable();
    }else{
      var branch = adminBranchesTabBloc.current();
      return AdminBranchesTabInformationRowLeftColumn(branch: branch,);
    }

  }
}