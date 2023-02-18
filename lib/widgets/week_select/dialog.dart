import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledCalendar.dart';
import 'package:time_machine/time_machine.dart' as timeMachine;

class WeekSelectDialog extends StatefulWidget {
  final DateTime start;

  final Function(DateTime value) onChanged;

  const WeekSelectDialog(
      {Key? key, required this.start, required this.onChanged})
      : super(key: key);

  @override
  _WeekSelectDialogState createState() => _WeekSelectDialogState();
}

class _WeekSelectDialogState extends State<WeekSelectDialog> {
  late DateTime start;

  @override
  void initState() {
    super.initState();
    start = widget.start;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var date = timeMachine.LocalDate.dateTime(start)
        .addMonths(index - 1)
        .toDateTimeUnspecified();
    var decorate = date.month == start.month;
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
            width: 360,
            height: 420,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            child: ControlledCalendar(
              key: ValueKey("ExpandedCalendar${date.month}${date.year}"),
              weekStartsMonday: true,
              onChange: (DateTime? newSelectedDate) {
                setState(() {
                  if (newSelectedDate != null) {
                    start = newSelectedDate;
                    widget.onChanged(newSelectedDate);
                  }
                });
              },
              decorate: decorate,
              disableNavigation: true,
              selectedDay: decorate ? start : date,
              rowHeight: 32,
              titleStyle: TextStyle(),
              dayOfWeekStyle: TextStyle(),
              dateStyle: TextStyle(),
              selectedDateStyle: TextStyle(),
              inactiveDateStyle: TextStyle(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    // "6 May 2022 - 12 May 2022"
    var format = new DateFormat("MMMM dd, yyyy");
    var startString = format.format(start);
    var endString = format.format(start.add(Duration(days: 6)));
    var text = "$startString - $endString";

    var size = MediaQuery.of(context).size;

    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
            content: Container(
                width: size.width * .9,
                child: Stack(children: [
                  Flex(direction: Axis.vertical, children: [
                    Container(height: 16),
                    Text(
                      'Select Week',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Container(
                        height: 420,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              itemBuilder: _itemBuilder,
                              shrinkWrap: true,
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                            ))),
                    Container(
                      height: 64,
                    ),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ]),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ]))
        ));
  }
}
