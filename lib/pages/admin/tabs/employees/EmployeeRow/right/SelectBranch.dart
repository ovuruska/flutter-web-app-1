import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledDropdownButton.dart';
import '../controller.dart';

class AdminEmployeeTabEmployeeRowRightColumnSelectBranch
    extends StatefulWidget {
  final Branch? branch;

  const AdminEmployeeTabEmployeeRowRightColumnSelectBranch(
      {Key? key, this.branch})
      : super(key: key);

  @override
  _AdminEmployeeTabEmployeeRowRightColumnSelectBranchState createState() =>
      _AdminEmployeeTabEmployeeRowRightColumnSelectBranchState();
}

class _AdminEmployeeTabEmployeeRowRightColumnSelectBranchState
    extends State<AdminEmployeeTabEmployeeRowRightColumnSelectBranch> {
  Branch? current;

  @override
  void initState() {
    super.initState();
    current = widget.branch;
  }

  @override
  Widget build(BuildContext context) {
    return ControlledDropdownButton<Branch>(
        value: current,
        onChanged: (branch) {
          setState(() {
            current = branch;
            adminEmployeeTabEmployeeRowBloc.setBranch(branch);
          });
        },
        options: branchesBloc.value.branches);
  }
}
