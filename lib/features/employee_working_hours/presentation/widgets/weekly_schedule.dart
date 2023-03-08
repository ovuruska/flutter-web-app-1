import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/employee_working_hours/presentation/widgets/button_group.dart';

import '../../domain/entities/daily_schedule_entity.dart';
import 'daily_schedule.dart';

class WeeklyScheduleWidget extends StatefulWidget {
  final List<DailyScheduleEntity>? initialValue;
  final int employee;
  final Function(List<DailyScheduleEntity>)? onSaved;
  final Function()? onClear;

  const WeeklyScheduleWidget(
      {Key? key, this.initialValue, required this.employee, this.onSaved, this.onClear})
      : super(key: key);

  static List<DailyScheduleEntity> empty() {
    var now = DateTime.now();

    var monday = now.subtract(Duration(days: now.weekday - 1));
    var days = List.generate(7, (index) => monday.add(Duration(days: index)));
    return days
        .map((e) => DailyScheduleEntity(
              date: e,
              employee: 0,
            ))
        .toList();
  }

  @override
  _WeeklyScheduleWidgetState createState() => _WeeklyScheduleWidgetState();
}

class _WeeklyScheduleWidgetState extends State<WeeklyScheduleWidget> {
  late List<DailyScheduleEntity> weeklySchedule;
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
