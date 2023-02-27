import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/modify_branch/domain/usecases/save_branch.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_event.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/widgets/branch_card_settings.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/widgets/search_branches.dart';

import '../../../../injection.dart';
import '../../../../models/Branch.dart';
import '../../../search_branches/presentation/bloc/search_branches_bloc.dart';
import '../../../search_branches/presentation/bloc/search_branches_event.dart';
import '../bloc/modify_branch_state.dart';

class ModifyBranch extends StatelessWidget {

  final Function(Branch)? onSaved;

  const ModifyBranch({Key? key, this.onSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyBranchBloc, ModifyBranchState>(
      bloc: sl<ModifyBranchBloc>(),
      builder: (context, state) {
        if(state is SetBranch){
          var branchId = state.branch.id;
          return BranchCardSettings(
            key : Key(branchId.toString()),
            branch: state.branch,
            onSaved: (branch) {
              SaveBranchParams params = SaveBranchParams(branch: branch);
              sl<SaveBranchUseCase>().call(params);

              if(onSaved != null){
                onSaved!(branch.toBranch());
              }
            }, onRemoved: (BranchEntity ) {
            sl<SearchBranchesBloc>().add(RemoveBranchEvent(id: branchId));
            sl<ModifyBranchBloc>().add(ClearBranchEvent());
          },
          );
        }else if(state is Empty) {
          return Center(child: Text('No branch is selected.'));
        }else{
          return Center(child: Text('Something went wrong.'));
        }
      },
    );
  }
}
