import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import '../../../../flutter_flow/flutter_flow_util.dart';

class DurationDropdown extends StatelessWidget {
  final int interval;
  final int start;
  final int end;
  final TimeOfDay value;
  final Function(TimeOfDay) onChanged;

  DurationDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
    this.interval = 15,
    this.start = 15,
    this.end = 240,
  }) : super(key: key);

  TimeOfDay getTimeOfDayFromMinutes(int minutes){
    return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
  }

  int getMinutesFromTimeOfDay(TimeOfDay timeOfDay){
    return timeOfDay.hour * 60 + timeOfDay.minute;
  }

  List<int> generateOptions() {
    List<int> options = [];
    for (var i = start; i <= end; i += interval) {
      options.add(i);
    }
    return options;
  }

  String getFormattedHourAndMinute(int durationInMinutes) {
    var timeOfDay = getTimeOfDayFromMinutes(durationInMinutes);
    return DateFormat('HH mm')
        .format(DateTime(2021, 1, 1, timeOfDay.hour, timeOfDay.minute));
  }

  @override
  Widget build(BuildContext context) {
    var valueInMinutes = getMinutesFromTimeOfDay(value);
    return DropdownButton<int>(
      value: valueInMinutes,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: FlutterFlowTheme.of(context).bodyText2,
      underline: Container(
        height: 2,
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      onChanged: (int? value) {
        if (value != null) {
          var timeOfDay = getTimeOfDayFromMinutes(value);
          onChanged(timeOfDay);
        }
      },
      items:
          generateOptions().map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                    value: value,
                    child: Text(getFormattedHourAndMinute(value)));
              }).toList() +
              [
                DropdownMenuItem<int>(
                    value: valueInMinutes, child: Text(getFormattedHourAndMinute(valueInMinutes)))
              ],
    );
  }
}
