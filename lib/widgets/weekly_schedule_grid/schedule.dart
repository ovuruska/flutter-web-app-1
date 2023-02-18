import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/utils.dart';

import 'box.dart';

class WeeklyScheduleGrid extends StatelessWidget {
  final Function(DateTime time, bool newValue) onTap;
  final Function(DateTime time, bool newValue) onLongPress;
  final DateTime start;
  final List<DateTime> value;
  final bool showWeekdays;
  final bool showHours;
  final double? childAspectRatio;

  static DateFormat dayFormatter = DateFormat('EEEE');

  WeeklyScheduleGrid({
    required this.onTap,
    required this.start,
    required this.value,
    required this.onLongPress,
    this.showWeekdays = true,
    this.showHours = true,
    this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    var days = List.generate(
        7, (i) => DateTime(start.year, start.month, start.day + (i)));

    return Flexible(
        child: GridView.count(
            childAspectRatio: childAspectRatio ?? 1,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 25,
            shrinkWrap: true,
            children: List.generate(25 * 8, (index) {
              if (index == 0) {
                return Container();
              }

              if (index % 25 == 0) {
                // Create a new box with the current day

                var mult = index ~/ 25 - 1;
                var nameOfDay = dayFormatter.format(days[mult]);
                return (showWeekdays)
                    ? Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 2,
                                    style: BorderStyle.solid))),
                        child: Center(child: Text(nameOfDay.substring(0, 3))))
                    : Container();
              } else if (index < 25) {
                index = index - 1;
                String text = StringUtils.getFormattedHour(index);

                return (showHours)
                    ? Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 2,
                                    style: BorderStyle.solid))),
                        child: Center(child: Text(text)))
                    : Container();
              } else {
                var newIndex = (index - 25) - (index ~/ 25);
                var boxDate = dateFromIndex(newIndex, start: start);
                var selected = value.contains(boxDate);
                return WeeklyScheduleBox(
                  date: boxDate,
                  onTap: onTap,
                  selected: selected,
                  onLongPress: onLongPress,
                );
              }
            })));
  }
}
