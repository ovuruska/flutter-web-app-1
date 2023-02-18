import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';

import 'model.dart';
import 'row.dart';

class WeeklyScheduleBranch extends StatelessWidget {
  final List<WeeklyScheduleBranchModel> data;
  final Function(WeeklyScheduleBranchModel) onChanged;

  const WeeklyScheduleBranch({Key? key, required this.data, required this.onChanged})
      : super(key: key);

  static List<WeeklyScheduleBranchModel> empty() {
    var now = DateTime.now();
    var startOfWeek = now.startOfWeek();
    return List.generate(
        7,
        (index) => WeeklyScheduleBranchModel(
            date: startOfWeek.add(Duration(days: index)),
            working: true,
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
              (index) => WeeklyScheduleBranchRow(
                key: Key(data[index].date.toString()),
                    data: data[index],
                    onChanged: onChanged,
                  ))
        ],
      ),
    );
  }
}
