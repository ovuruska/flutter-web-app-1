import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../bloc/app_select_branch_bloc.dart';
import '../bloc/app_select_branch_event.dart';
import '../bloc/app_select_branch_state.dart';
import '../widgets/app_select_branch.dart';

class AppSelectBranchView extends StatefulWidget {
  const AppSelectBranchView({Key? key}) : super(key: key);

  @override
  _AppSelectBranchViewState createState() => _AppSelectBranchViewState();
}

class _AppSelectBranchViewState extends State<AppSelectBranchView> {
  void initState() {
    super.initState();
    sl.get<AppSelectBranchBloc>().add(AppSelectBranchEventGetAll());

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSelectBranchBloc, AppSelectBranchState>(
        bloc: sl<AppSelectBranchBloc>(),
        builder: (context, state) {
          if (state is AppSelectBranchStateLoaded) {
            return AppSelectBranch(branches: state.branches,branch: state.branch);
          } else {
            return AppSelectBranch(branches: []);
          }
        });
  }
}
