import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_drop_down.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class HourSelect extends StatelessWidget {
  final int interval;
  final DateTime date;
  late DateTime min;
  late DateTime max;
  final Function(DateTime?) onChanged;
  final DateTime? value;
  final String label;
  final bool disabled;

  HourSelect(
      {Key? key,
      this.interval = 30,
      required this.date,
      required this.onChanged,
      this.label = "Hour",
      this.value,
        this.disabled = false,
        DateTime? max,
      DateTime? min})
      : super(key: key) {
    this.min = min ?? DateTime(date.year, date.month, date.day, 0, 0, 0);
    this.max = DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  List<DateTime> _options() {
    var items = <DateTime>[];

    var current = min;
    while (current.isBefore(max)) {
      items.add(current);
      current = current.add(Duration(minutes: interval));
    }
    return items;
  }

  List<String> _labels(List<DateTime> dates) {
    // 12:00 AM
    var formatter = DateFormat("h:mm a");
    return dates.map<String>((e) => formatter.format(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var options = _options();
    return FlutterFlowDropDown<DateTime?>(
      borderColor: FlutterFlowTheme.of(context).secondaryColor,
      value: value,
      hintText: label,
      optionLabels: _labels(options),
      options: options,
      onChanged: onChanged,
      textStyle: FlutterFlowTheme.of(context).bodyText1,
      elevation: 3,
      disabled: disabled,
      borderWidth: 2,
      borderRadius: 0,
      margin: EdgeInsets.all(8),
    );
  }
}
