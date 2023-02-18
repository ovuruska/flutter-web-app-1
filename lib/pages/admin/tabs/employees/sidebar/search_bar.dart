import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../controller.dart';
import 'select_branch.dart';

class AdminEmployeeTabSearchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
        child: Column(children: [
          Container(
              child: ClearableTextInput(
            label: "Employee name",
            hintText: "Employee name",
            onChanged: (String? value) {
              if (value != null) {
                adminEmployeeTabBloc.setEmployeeName(value);
              } else {
                adminEmployeeTabBloc.setEmployeeName("");
              }
            },
          )),
          AdminEmployeeTabSelectBranch()
          // TODO: Select by grooming type.
        ]));
  }
}
