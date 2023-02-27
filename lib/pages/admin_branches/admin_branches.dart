import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/pages/modify_branch.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/bloc/search_branches_bloc.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import '../../features/modify_branch/presentation/bloc/modify_branch_bloc.dart';
import '../../features/modify_branch/presentation/bloc/modify_branch_event.dart';
import '../../features/search_branches/presentation/bloc/search_branches_event.dart';
import '../../features/search_branches/presentation/pages/search_branches.dart';
import '../../injection.dart';
import '../../models/Branch.dart';

class AdminBranchesTab extends StatelessWidget {
  onSelect(Branch branch) {
    sl<ModifyBranchBloc>().add(SetBranchEvent(branch: branch));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          FlutterFlowTheme.of(context).primaryColor.withOpacity(.5),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: SearchBranchesView(
                selectBranch: onSelect,
              )),
          Expanded(
              flex: 4,
              child: Container(
                height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(24),
                    ),
                  ),
                  child: ModifyBranch(
                    onSaved: (branch) {
                      sl<SearchBranchesBloc>()
                          .add(PatchBranchEvent(branch: branch));
                    },
                  )))
        ],
      ),
    );
  }
}
