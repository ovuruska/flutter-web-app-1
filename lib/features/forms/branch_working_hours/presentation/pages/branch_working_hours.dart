import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../injection.dart';
import '../../domain/entities/branch_schedule_entity.dart';
import '../bloc/branch_working_hours_bloc.dart';
import '../bloc/branch_working_hours_event.dart';
import '../bloc/branch_working_hours_state.dart';
import '../widgets/weekly_schedule.dart';

class BranchWorkingHoursView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BranchWorkingHoursViewState();
}

class _BranchWorkingHoursViewState extends State<BranchWorkingHoursView> {
  Widget _container(List<BranchScheduleEntity> workingHours, int employee) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 48,
          margin: EdgeInsets.only(left: 16),
          child: Text("Weekly Schedule",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000))),
        ),
        WeeklyScheduleWidget(
          key: Key(DateTime.now().toString()),
          initialValue: workingHours,
          employee: employee,
          onClear: () {
            sl<BranchWorkingHoursBloc>().add(
              BranchWorkingHoursEventClear(
                id: employee,
              ),
            );
          },
          onSaved: (workingHours) {
            sl<BranchWorkingHoursBloc>().add(
              BranchWorkingHoursEventUpsert(
                id: employee,
                workingHours: workingHours,
              ),
            );
          },
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child:
              BlocBuilder<BranchWorkingHoursBloc, BranchWorkingHoursState>(
            bloc: sl<BranchWorkingHoursBloc>(),
            builder: (context, state) {
              if (state is BranchWorkingHoursStateLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BranchWorkingHoursStateLoaded) {
                var workingHours = state.workingHours;
                var employee = state.id;
                return _container(workingHours, employee);
              } else if (state is BranchWorkingHoursStateFailed) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is BranchWorkingHoursStateInitial) {
                var workingHours = WeeklyScheduleWidget.empty();
                var employeeId = state.id;
                return _container(workingHours, employeeId);
              } else {
                return Container();
              }
            },
          ),
        ));
  }
}
