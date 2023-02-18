import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dialog.dart';

class WeekSelect extends StatelessWidget {
  final DateTime start;
  final Function(DateTime value) onChanged;

  const WeekSelect({Key? key, required this.start, required this.onChanged})
      : super(key: key);

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) =>
            WeekSelectDialog(start: start, onChanged: onChanged));
  }

  @override
  Widget build(BuildContext context) {
    // "6 May 2022 - 12 May 2022"
    var format = new DateFormat("MMMM dd, yyyy");
    var startString = format.format(start);
    var endString = format.format(start.add(Duration(days: 6)));
    var text = "$startString - $endString";

    return GestureDetector(
        onTap: () => dialogBuilder(context),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: SizedBox(
                height: 36,
                width: 256,
                child: TextField(
                    enabled: false,
                    controller: TextEditingController(text: text),
                    readOnly: true,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today),
                    )))));
  }
}
