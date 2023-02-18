import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/DatePicker.dart';
import '../Controller.dart';



class PayrollFilterInputSelectStartDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      text: "Start Date",
      onChanged: (value) {
        if (value != null) {
          payrollFilterInputBloc.setStartDate(value);
        }
      },
      onClear: () => payrollFilterInputBloc.setStartDate(null),
    );
  }

}
