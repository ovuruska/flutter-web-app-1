import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/forms/employee_information_crud/presentation/bloc/employee_information_crud_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/employee_information_crud/presentation/bloc/employee_information_crud_event.dart';
import 'package:scrubbers_employee_application/features/sidebars/employee_search/presentation/bloc/employee_search_event.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';
import 'package:scrubbers_employee_application/injection.dart';

import '../../../../sidebars/employee_search/presentation/bloc/employee_search_bloc.dart';
import '../../domain/entities/daily_schedule_entity.dart';
import '../bloc/working_hours_bloc.dart';
import '../bloc/working_hours_event.dart';
import 'button_group.dart';
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
          showSnackbar(context, "Weekly schedule is cleared.");

        }, onSave: (){
          widget.onSaved?.call(weeklySchedule);
          showSnackbar(context, "Weekly schedule is successfully updated.");

        },onRemove:
            (){
          Future.delayed(Duration(milliseconds: 150), () {
            sl<EmployeeSearchBloc>().add(EmployeeSearchEventRemove(id: widget.employee));
            sl<EmployeeWorkingHoursBloc>().add(EmployeeWorkingHoursEventPurge());
            sl<EmployeeInformationCrudBloc>().add(EmployeeInformationCrudEventPurge());
            showSnackbar(context, "Employee #${widget.employee} removed");
          });
        },
        )
      ]),
    );
  }
}
