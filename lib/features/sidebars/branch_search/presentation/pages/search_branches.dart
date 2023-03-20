import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../../../../../models/Branch.dart';
import '../bloc/search_branches_bloc.dart';
import '../bloc/search_branches_event.dart';
import '../bloc/search_branches_state.dart';
import '../widgets/search_branches.dart';

class SearchBranchesView extends StatefulWidget {

  final Function(Branch)? selectBranch;

  const SearchBranchesView({Key? key, this.selectBranch}) : super(key: key);

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
            onPressed: (branch) {
              if (widget.selectBranch != null) {
                widget.selectBranch!(branch);
              }
            },
          );
        }
        return Container();
      },
    );
  }
}