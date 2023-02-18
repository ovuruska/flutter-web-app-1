import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../controller.dart';

class AdminBranchesTabSearchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
        child: Column(children: [
          Container(
              child: ClearableTextInput(
            label: "Branch name",
            hintText: "Branch name",
            onChanged: (String? value) {
              if (value != null) {
                adminBranchesTabBloc.setBranchName(value);
              } else {
                adminBranchesTabBloc.setBranchName("");
              }
            },
          )),
        ]));
  }
}
