import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/inputs/FlutterFlowCalendar.dart';

class AppCalendarHeader extends StatelessWidget {
  const AppCalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    this.iconColor,
    this.titleStyle,
    this.locale,
    required this.onTodayButtonTap,
  }) : super(key: key);

  final DateTime focusedDay;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onTodayButtonTap;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final String? locale;

  @override
  Widget build(BuildContext context) => Container(
      decoration: const BoxDecoration(),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(children: [
        Positioned(
          child: CustomIconButton(
            icon: Icon(Icons.calendar_today,  color: const Color(0xFF494C68).withOpacity(.9)),
            onTap: onTodayButtonTap,
          ),
          left: 0,
          top: 0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 16,
            ),
            CustomIconButton(
              icon: Icon(Icons.chevron_left, color: iconColor),
              onTap: onLeftChevronTap,
            ),
            SizedBox(
              child: Center(
                  child: Text(
                DateFormat.yMMMM(locale).format(focusedDay),
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    color: const Color(0xFF494C68)),
              )),
              width: 160,
            ),
            CustomIconButton(
              icon: Icon(Icons.chevron_right, color: iconColor),
              onTap: onRightChevronTap,
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),

      ]));
}
