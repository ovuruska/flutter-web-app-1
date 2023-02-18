

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/payroll/Filter/inputs/end_date.dart';
import 'package:scrubbers_employee_application/pages/payroll/Filter/inputs/start_date.dart';
import 'package:scrubbers_employee_application/pages/payroll/Filter/inputs/SubmitButton.dart';

import 'inputs/branch.dart';

class PayrollFilterView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PayrollFilterInputSelectBranch(),
          PayrollFilterInputSelectStartDate(),
          PayrollFilterInputSelectEndDate(),
          PayrollFilterInputSubmitButton()
        ],
      )
    );
  }

}