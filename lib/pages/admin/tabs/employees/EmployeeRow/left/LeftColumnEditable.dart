import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../../controller.dart';
import '../controller.dart';
import '../utils.dart';

class AdminEmployeeTabEmployeeRowLeftColumnEditable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var employee = adminEmployeeTabBloc.getCurrent();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(BoldText(text: "ID")),
              Flexible(
                child: ClearableTextInput(
                  label: "Name",
                  initialValue: employee?.name ?? "",
                  onChanged: (String? value) {
                    if (value == null) {
                      adminEmployeeTabEmployeeRowBloc.setName("");
                    } else {
                      adminEmployeeTabEmployeeRowBloc.setName(value);
                    }
                  },
                ),
              ),
              Flexible(
                  child: ClearableTextInput(
                label: "Role",
                initialValue: employee?.role ?? "",
                onChanged: (String? value) {
                  if (value == null) {
                    adminEmployeeTabEmployeeRowBloc.setRole("");
                  } else {
                    adminEmployeeTabEmployeeRowBloc.setRole(value);
                  }
                },
              ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(InfoText(text: employee?.id.toString() ?? "")),
            ],
          )
        ],
      ),
    );
  }
}
