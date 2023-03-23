import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/admin/admin_page_context.dart';

import 'layouts/admin_employees.dart';

class AdminViewScreenFactory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageContext = AdminPageContextProvider.of(context);
    var selectedIndex = pageContext.notifier!.selectedIndex;
    if(selectedIndex == 0){
      return AdminEmployees();
    }else if(selectedIndex == 1) {
      return AdminEmployees();
    }else{
      return AdminEmployees();
    }

  }

}