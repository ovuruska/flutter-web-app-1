import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';

import 'model.dart';
import 'row.dart';

class WeeklyScheduleEmployee extends StatelessWidget {
  final List<WeeklyScheduleEmployeeModel> data;
  final Function(WeeklyScheduleEmployeeModel) onChanged;

  const WeeklyScheduleEmployee({Key? key, required this.data, required this.onChanged})
      : super(key: key);

  static List<WeeklyScheduleEmployeeModel> empty() {
    var now = DateTime.now();
    var startOfWeek = now.startOfWeek();
    return List.generate(
        7,
        (index) => WeeklyScheduleEmployeeModel(
            date: startOfWeek.add(Duration(days: index)),
            working: true,
            branch: null,
            start: null,
            end: null));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ...List.generate(
              7,
              (index) => WeeklyScheduleRow(
                key: Key(data[index].date.toString()),
                    data: data[index],
                    onChanged: onChanged,
                  ))
        ],
      ),
    );
  }
}
