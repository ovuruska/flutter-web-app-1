

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../../controller.dart';
import 'column.dart';
import 'column_editable.dart';

class AdminBranchesTabInformationRowRightColumnView extends StatelessWidget{
  final bool editable;

  const AdminBranchesTabInformationRowRightColumnView({Key? key, this.editable = false}) : super(key: key);



  Widget build(BuildContext context) {
    if(editable){
      return AdminBranchesTabInformationRowRightColumnEditable();
    }else{
      return AdminBranchesTabInformationRowRightColumn();
    }

  }
}