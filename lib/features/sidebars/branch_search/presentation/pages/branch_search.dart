import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';

import '../../../../../injection.dart';
import '../bloc/search_branches_bloc.dart';
import '../bloc/search_branches_event.dart';
import '../bloc/search_branches_state.dart';
import '../widgets/search_branches.dart';

class BranchSearchView extends StatefulWidget {

  final Function(BranchEntity)? selectBranch;

  const BranchSearchView({Key? key, this.selectBranch}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BranchSearchViewState();
  }
}

class _BranchSearchViewState extends State<BranchSearchView> {
  @override
  void initState() {
    super.initState();
    sl<SearchBranchesBloc>().add(SearchBranchesEventGetBranches());
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
