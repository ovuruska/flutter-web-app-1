import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WeeklyScheduleBox extends StatelessWidget {
  final DateTime date;
  final Function(DateTime date, bool newValue) onTap;
  final Function(DateTime date, bool newValue) onLongPress;
  final bool selected;

  WeeklyScheduleBox({
    required this.date,
    required this.onTap,
    required this.selected, required this.onLongPress,
  });

  Color _color() {
    if (selected) {
      return Colors.green;
    } else {
      return Colors.grey[300]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        hitTestBehavior: HitTestBehavior.translucent,
        onEnter: (PointerEnterEvent event) {
          if(event.buttons == 1) {
            onLongPress(date, true);
          }
          if(event.buttons == 2){
            onLongPress(date, false);
          }
        },
        child: GestureDetector(
            onTapDown: (_) => onTap(date, true),
            onSecondaryTapDown: (_) => onTap(date, false),
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: _color(), border: Border.all(color: Colors.black)),
            )));
  }
}
