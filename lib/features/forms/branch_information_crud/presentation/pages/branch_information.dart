import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/branch_information_crud_bloc.dart';
import '../bloc/branch_information_crud_state.dart';
import '../widgets/branch_information.dart';

class BranchInformationCrudView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchInformationCrudBloc,
        BranchInformationCrudState>(
      bloc: sl<BranchInformationCrudBloc>(),
      builder: (context, state) {
        return state.branch != null
            ? BranchInformationCrud(
                key: ValueKey(state.branch!.id),
                branch: state.branch!)
            : Container(
                child: Center(
                  child: Text('No branch selected'),
                ),
              );
      },
    );
  }
}
