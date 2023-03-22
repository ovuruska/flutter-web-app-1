import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../blocs/branch_select_bloc.dart';
import '../blocs/branch_select_event.dart';
import '../blocs/branch_select_state.dart';
import '../widgets/branch_select.dart';

class MultiBranchSelectView extends StatefulWidget {
  @override
  _MultiBranchSelectViewState createState() => _MultiBranchSelectViewState();
}

class _MultiBranchSelectViewState extends State<MultiBranchSelectView> {

  @override
  void initState() {
    super.initState();
    sl<MultiBranchSelectBloc>().add(MultiBranchSelectEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiBranchSelectBloc, MultiBranchSelectState>(
        bloc: sl<MultiBranchSelectBloc>(),
        builder: (context, state) {
          return MultiBranchSelect(options: state.options);
        });
  }
}
