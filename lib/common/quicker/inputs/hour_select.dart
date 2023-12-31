import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/time_of_day.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_drop_down.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class QuickerHourSelect extends StatelessWidget {
  final int interval;
  late TimeOfDay min;
  late TimeOfDay max;
  final Function(TimeOfDay?) onChanged;
  final TimeOfDay? value;
  final String label;
  final bool disabled;

  QuickerHourSelect(
      {Key? key,
      this.interval = 30,
      required this.onChanged,
      this.label = "Hour",
      this.value,
        this.disabled = false,
        TimeOfDay? max,
        TimeOfDay? min})
      : super(key: key) {
    this.min = min ?? TimeOfDay(hour: 0, minute: 0);
    this.max = max ?? TimeOfDay(hour: 24, minute: 0);
    if (this.min.isAfter(this.max)) {
      var temp = this.min;
      this.min = this.max;
      this.max = temp;

    }
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

  TimeOfDay? quantize(TimeOfDay? timeOfDay){
    if(timeOfDay == null){
      return null;
    }
    int newMinute = (timeOfDay.minute ~/ 30) * 30;
    var current = TimeOfDay(hour: timeOfDay.hour, minute: newMinute);
    return current;

  }

  @override
  Widget build(BuildContext context) {
    var options = _options();
    return FlutterFlowDropDown<TimeOfDay?>(
      borderColor: FlutterFlowTheme.of(context).secondaryColor,
      value: quantize(value),
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
