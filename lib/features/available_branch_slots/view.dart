import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';
import 'package:scrubbers_employee_application/injection.dart';
import 'package:scrubbers_employee_application/widgets/branch_slot/branch_slot.dart';

import 'bloc/available_branch_slots_bloc.dart';
import 'bloc/available_branch_slots_state.dart';

class AvailableBranchSlotsView extends StatefulWidget {
  final Function(DailySlotEntity)? onTap;

  const AvailableBranchSlotsView({Key? key, this.onTap}) : super(key: key);

  @override
  _AvailableBranchSlotsViewState createState() =>
      _AvailableBranchSlotsViewState();
}

class _AvailableBranchSlotsViewState extends State<AvailableBranchSlotsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableBranchSlotsBloc, AvailableBranchSlotsState>(
      bloc: sl<AvailableBranchSlotsBloc>(),
      builder: (context, state) {
        if (state is AvailableBranchSlotsStateLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AvailableBranchSlotsStateError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is AvailableBranchSlotsStateLoaded) {
          return ListView.builder(
            itemCount: state.slots.length,
            itemBuilder: (context, index) {
              return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () {
                        widget.onTap?.call(state.slots[index]);
                      },
                      child: BranchSlot(
                        slot: state.slots[index],
                      )));
            },
          );
        } else {
          return Center(
            child: Text('No slots found.'),
          );
        }
      },
    );
  }
}
