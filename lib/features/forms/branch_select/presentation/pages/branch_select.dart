import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../blocs/branch_select_bloc.dart';
import '../blocs/branch_select_event.dart';
import '../blocs/branch_select_state.dart';
import '../widgets/branch_select.dart';

class BranchSelectView extends StatefulWidget {
  @override
  _BranchSelectViewState createState() => _BranchSelectViewState();
}

class _BranchSelectViewState extends State<BranchSelectView> {

  @override
  void initState() {
    super.initState();
    sl<BranchSelectBloc>().add(BranchSelectEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchSelectBloc, BranchSelectState>(
        bloc: sl<BranchSelectBloc>(),
        builder: (context, state) {
          return BranchSelect(options: state.options);
        });
  }
}
