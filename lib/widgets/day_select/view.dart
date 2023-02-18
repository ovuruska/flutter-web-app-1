import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dialog.dart';

class DaySelect extends StatelessWidget {
  final DateTime start;
  final Function(DateTime value) onChanged;

  const DaySelect({Key? key, required this.start, required this.onChanged})
      : super(key: key);

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) =>
            DaySelectDialog(start: start, onChanged: onChanged));
  }

  @override
  Widget build(BuildContext context) {
    // "6 May 2022 - 12 May 2022"
    var format = new DateFormat("MMMM dd, yyyy");
    var text = format.format(start);

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
