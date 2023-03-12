import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../domain/entities/branch_id_and_name.dart';
import '../bloc/calendar_and_branch_bloc.dart';
import '../bloc/calendar_and_branch_event.dart';
import '../bloc/calendar_and_branch_state.dart';
import '../widgets/app_calendar_view.dart';
import '../widgets/calendar_and_branch.dart';
import '../widgets/calendar_and_branch_loading.dart';
import '../widgets/select_branch.dart';

class CalendarAndBranchView extends StatefulWidget {
  const CalendarAndBranchView(
      {Key? key, this.onDateSelected, this.onBranchSelected})
      : super(key: key);
  final Function(DateTime)? onDateSelected;
  final Function(int)? onBranchSelected;

  @override
  _CalendarAndBranchViewState createState() => _CalendarAndBranchViewState();
}

class _CalendarAndBranchViewState extends State<CalendarAndBranchView> {

  void initState() {
    super.initState();
    sl.get<CalendarAndBranchBloc>().add(GetAllBranchesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarAndBranchBloc, CalendarAndBranchState>(
        bloc: sl<CalendarAndBranchBloc>(),
        builder: (context, state) {
          if (state is Loading) {
            return CalendarAndBranchLoading();
          } else if (state is Loaded) {
            return CalendarAndBranch(
                branches: state.branches,
                onDateSelected: widget.onDateSelected,
                onBranchSelected: widget.onBranchSelected);
          } else {
            return CalendarAndBranch(
                branches: [],
                onDateSelected: widget.onDateSelected,
                onBranchSelected: widget.onBranchSelected);
          }
        });
  }
}
