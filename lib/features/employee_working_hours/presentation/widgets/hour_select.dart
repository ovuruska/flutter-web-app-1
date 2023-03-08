import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/time_of_day.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_drop_down.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class HourSelect extends StatelessWidget {
  final int interval;
  late TimeOfDay min;
  late TimeOfDay max;
  final Function(TimeOfDay?) onChanged;
  final TimeOfDay? value;
  final String label;
  final bool disabled;

  HourSelect(
      {Key? key,
      this.interval = 30,
      required this.onChanged,
      this.label = "Hour",
      this.value,
        this.disabled = false,
        TimeOfDay? max,
        TimeOfDay? min})
      : super(key: key) {
    this.min = min ?? TimeOfDay(hour: 7, minute: 30);
    this.max = max ?? TimeOfDay(hour: 21, minute: 0);
  }

  List<TimeOfDay> _options() {
    var items = <TimeOfDay>[];

    var current = min.add(Duration(minutes: interval - min.minute % interval));
    while (current.isBefore(max)) {
      items.add(current);
      current = current.add(Duration(minutes: interval));
    }
    return items;
  }

  List<String> _labels(List<TimeOfDay> dates) {
    // 12:00 AM
    var formatter = DateFormat("h:mm a");

    return dates.map<String>((e) => formatter.format(DateTime(0,0,0,e.hour,e.minute))).toList();
  }

  @override
  Widget build(BuildContext context) {
    var options = _options();
    return FlutterFlowDropDown<TimeOfDay?>(
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
