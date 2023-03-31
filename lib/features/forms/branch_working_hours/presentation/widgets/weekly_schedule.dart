import 'package:flutter/material.dart';

import '../../domain/entities/branch_schedule_entity.dart';
import 'button_group.dart';
import 'daily_schedule.dart';

class WeeklyScheduleWidget extends StatefulWidget {
  final List<BranchScheduleEntity>? initialValue;
  final int employee;
  final Function(List<BranchScheduleEntity>)? onSaved;
  final Function()? onClear;

  const WeeklyScheduleWidget(
      {Key? key, this.initialValue, required this.employee, this.onSaved, this.onClear})
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
            key: Key(widget.employee.toString() +
                " " +
                dailySchedule.date.toString()),
            date: dailySchedule.date,
            employee: widget.employee,
            onSaved: (entity) {
              setState(() {
                weeklySchedule[index] = entity;
              });
            },
          );
        }),
        ButtonGroup(onClear: (){
          widget.onClear?.call();
        }, onSave: (){
          widget.onSaved?.call(weeklySchedule);
        })
      ]),
    );
  }
}
