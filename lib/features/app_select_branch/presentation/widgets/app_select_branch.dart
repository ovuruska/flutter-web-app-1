


import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/callbacks/set_branch_callback.dart';

import '../../../../injection.dart';
import '../../domain/entities/branch_id_and_name.dart';
import '../bloc/app_select_branch_bloc.dart';
import '../bloc/app_select_branch_event.dart';
import 'select_branch.dart';

class AppSelectBranch extends StatelessWidget {

  final BranchIdAndName? branch;
  final List<BranchIdAndName> branches;


  const AppSelectBranch({Key? key, this.branch, required this.branches}) : super(key: key);

  onBranchSelected(BranchIdAndName? branch) {
    sl<AppSelectBranchBloc>().add(AppSelectBranchSetBranchEvent(branch: branch));
    getItMaybe<AppSelectBranchSetBranchCallback>()?.call(branch);
  }

  @override
  Widget build(BuildContext context) {

    return SelectBranch(
      branches: branches,
      selectedBranch: branch,
      onBranchSelected:(branch) => onBranchSelected(branch )
    );
  }



}