import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/bloc/search_branches_state.dart';

import '../../../../injection.dart';
import '../bloc/search_branches_bloc.dart';
import '../bloc/search_branches_event.dart';
import '../widgets/search.dart';

class SearchBranchesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchBranchesViewState();
  }
}

class _SearchBranchesViewState extends State<SearchBranchesView> {
  @override
  void initState() {
    super.initState();
    sl<SearchBranchesBloc>().add(GetBranchesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBranchesBloc, SearchBranchesState>(
      bloc: sl<SearchBranchesBloc>(),
      builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          var branches = state.branches;
          return SearchBranches(
            branches: branches,
          );
        }
        return Container();
      },
    );
  }
}
