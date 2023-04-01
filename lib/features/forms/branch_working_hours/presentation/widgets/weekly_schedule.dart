import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/forms/branch_information_crud/presentation/bloc/branch_information_crud_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/branch_information_crud/presentation/bloc/branch_information_crud_event.dart';
import 'package:scrubbers_employee_application/features/forms/branch_information_crud/presentation/widgets/branch_information.dart';
import 'package:scrubbers_employee_application/features/forms/branch_working_hours/presentation/bloc/branch_working_hours_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/branch_working_hours/presentation/bloc/branch_working_hours_event.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/bloc/search_branches_bloc.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/bloc/search_branches_event.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';
import 'package:scrubbers_employee_application/injection.dart';

import '../../domain/entities/branch_schedule_entity.dart';
import 'button_group.dart';
import 'daily_schedule.dart';

class WeeklyScheduleWidget extends StatefulWidget {
  final List<BranchScheduleEntity>? initialValue;
  final int branch;
  final Function(List<BranchScheduleEntity>)? onSaved;
  final Function()? onClear;

  const WeeklyScheduleWidget(
      {Key? key, this.initialValue, required this.branch, this.onSaved, this.onClear})
      : super(key: key);

  static List<BranchScheduleEntity> empty() {
    var now = DateTime.now();

    var monday = now.subtract(Duration(days: now.weekday - 1));
    var days = List.generate(7, (index) => monday.add(Duration(days: index)));
    return days
        .map((e) => BranchScheduleEntity(
              date: e,
            ))
        .toList();
  }

  @override
  _WeeklyScheduleWidgetState createState() => _WeeklyScheduleWidgetState();
}

class _WeeklyScheduleWidgetState extends State<WeeklyScheduleWidget> {
  late List<BranchScheduleEntity> weeklySchedule;
  @override
  void initState() {
    weeklySchedule = widget.initialValue ?? WeeklyScheduleWidget.empty();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ...List.generate(7, (index) {
          var dailySchedule = weeklySchedule[index];

          return DailyScheduleView(
            initialValue: dailySchedule,
            key: Key(widget.branch.toString() +
                " " +
                dailySchedule.date.toString()),
            date: dailySchedule.date,
            employee: widget.branch,
            onSaved: (entity) {
              setState(() {
                weeklySchedule[index] = entity;
              });
            },
          );
        }),
        ButtonGroup(onClear: (){
          widget.onClear?.call();
          showSnackbar(context, "Weekly schedule is cleared.");

        }, onSave: (){
          widget.onSaved?.call(weeklySchedule);
          showSnackbar(context, "Weekly schedule is successfully updated.");

        },onRemove:
            (){
              sl<SearchBranchesBloc>().add(SearchBranchesEventRemove(id: widget.branch));
              sl<BranchWorkingHoursBloc>().add(BranchWorkingHoursEventPurge());
              sl<BranchInformationCrudBloc>().add(BranchInformationCrudEventPurge());
              showSnackbar(context, "Branch #${widget.branch} removed");
            },
        )
      ]),
    );
  }
}
