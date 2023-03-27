import 'package:flutter/material.dart';

import '../../../../../flutter_flow/flutter_flow_util.dart';
import '../../domain/entities/daily_schedule_entity.dart';
import 'branch_select.dart';
import 'hour_select.dart';

class DailyScheduleView extends StatefulWidget {
  final Function(DailyScheduleEntity) onSaved;
  final DailyScheduleEntity? initialValue;
  final DateTime date;
  final int employee;

  DailyScheduleView({
    Key? key,
    required this.onSaved,
    this.initialValue,
    required this.date,
    required this.employee,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DailyScheduleViewState();
}

class _DailyScheduleViewState extends State<DailyScheduleView> {
  TimeOfDay? _start;
  TimeOfDay? _end;
  int? _branch;

  onChanged() {
    if (_start != null && _end != null && _branch != null) {
      widget.onSaved(DailyScheduleEntity(
        start: _start!,
        end: _end!,
        branch: _branch!,
        date: widget.date,
        employee: widget.employee,
      ));
    }
  }

  initState() {
    super.initState();
    if (widget.initialValue != null) {
      _start = widget.initialValue!.start;
      _end = widget.initialValue!.end;
      _branch = widget.initialValue!.branch;
    }
  }

  @override
  Widget build(BuildContext context) {
    var date = widget.date;
    var formatter = new DateFormat('EEEE');
    var dayName = formatter.format(date);
    return Flex(
      direction: Axis.horizontal,
      children: [
        Container(width: 160, child: Text(dayName)),
        Flexible(
            child: BranchSelect(
                value: _branch,
                onChanged: (value) {
                  setState(() {
                    _branch = value;
                  });
                  onChanged();
                })),
        Container(width: 16),
        Flexible(
            child: HourSelect(
                value: _start,
                max: _end,
                label: "Start",
                onChanged: (value) {
                  setState(() {
                    _start = value;
                  });
                  onChanged();
                })),
        Container(width: 16),
        Flexible(
            child: HourSelect(
                label: "End",
                min: _start,
                value: _end,
                onChanged: (value) {
                  setState(() {
                    _end = value;
                  });
                  onChanged();
                })),
      ],
    );
  }
}
