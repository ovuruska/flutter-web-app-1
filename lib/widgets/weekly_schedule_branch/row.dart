import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/widgets/inputs/hour_select.dart';

import 'model.dart';

class WeeklyScheduleBranchRow extends StatelessWidget {
  final WeeklyScheduleBranchModel data;
  final Function(WeeklyScheduleBranchModel) onChanged;

  const WeeklyScheduleBranchRow(
      {Key? key, required this.data, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = data.date;
    var formatter = new DateFormat('EEEE');
    var dayName = formatter.format(date);
    return Flex(
      direction: Axis.horizontal,
      children: [
        Checkbox(
            value: data.working,
            onChanged: (value) {
              onChanged(data.copyWith(working: value ?? false));
            }),
        Container(width: 160, child: Text(dayName)),

        Flexible(
            child: HourSelect(
                disabled: !data.working,
                max: data.end,
                label: "Start",
                date: date,
                value: data.start,
                onChanged: (value) {
                  onChanged(data.copyWith(start: value));
                })),
        Container(width: 16),
        Flexible(
            child: HourSelect(
                disabled: !data.working,
                label: "End",
                date: date,
                min: data.start,
                value: data.end,
                onChanged: (value) {
                  onChanged(data.copyWith(end: value));
                })),
      ],
    );
  }
}
