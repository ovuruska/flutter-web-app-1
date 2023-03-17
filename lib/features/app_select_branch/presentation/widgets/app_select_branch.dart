


import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/entities/branch_id_and_name.dart';

import 'select_branch.dart';

class AppSelectBranch extends StatelessWidget {

  final BranchIdAndName? branch;
  final List<BranchIdAndName> branches;


  const AppSelectBranch({Key? key, this.branch, required this.branches}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SelectBranch(
      branches: branches,
      selectedBranch: branch,
      onBranchSelected: (int ) {  },
    );
  }



}