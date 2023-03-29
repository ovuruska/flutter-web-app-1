import 'package:flutter/material.dart';

import '../../../../widgets/inputs/FlutterFlowCalendar.dart';

class AppMultiCalendarHeader extends StatelessWidget {
  const AppMultiCalendarHeader({
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
