import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../../controller.dart';
import '../controller.dart';

class AdminBranchesTabInformationRowRightColumnEditable
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentIndex = adminBranchesTabBloc.value.currentIndex;
    var branch = branchesBloc.value.branches[currentIndex];
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClearableTextInput(
                  label: "Description",
                  initialValue: branch.description,
                  onChanged: (String? value) {
                    if (value == null) {
                      adminBranchesTabInformationRowBloc.setDescription(branch.description);
                    } else {
                      adminBranchesTabInformationRowBloc.setDescription(value);
                    }
                  },
                ),
              ),
              Flexible(
                child: ClearableTextInput(
                  label: "Phone number",
                  initialValue: branch.phone,
                  onChanged: (String? value) {
                    if (value == null) {
                      adminBranchesTabInformationRowBloc.setPhone(branch.phone);
                    } else {
                      adminBranchesTabInformationRowBloc.setPhone(value);
                    }
                  },
                ),
              ),
              Flexible(
                  child: ClearableTextInput(
                label: "Address",
                initialValue: branch.address,
                onChanged: (String? value) {
                  if (value == null) {
                    adminBranchesTabInformationRowBloc.setAddress(branch.address);
                  } else {
                    adminBranchesTabInformationRowBloc.setAddress(value);
                  }
                },
              ))
            ],
          ),
        ],
      ),
    );
  }
}
