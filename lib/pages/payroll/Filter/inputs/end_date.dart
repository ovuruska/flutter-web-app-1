import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/DatePicker.dart';
import '../Controller.dart';



class PayrollFilterInputSelectEndDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      text: "End Date",
      onChanged: (value) {
        if (value != null) {
          payrollFilterInputBloc.setEndDate(value);
        }
      },
      onClear: () => payrollFilterInputBloc.setEndDate(null),
    );
  }

}
