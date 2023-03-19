
import 'package:flutter/material.dart';

import 'scheduling_context_provider.dart';

class CurrentTimeRay extends StatelessWidget {
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var schedulingContext = SchedulingContextProvider.of(context);

    if (now.hour < schedulingContext.startHour || now.hour > schedulingContext.endHour) {
      return Container();
    }
    var top = schedulingContext.headerHeight +
        now
            .difference(DateTime(now.year, now.month, now.day, 8, 0, 0))
            .inMinutes *
            schedulingContext.boxHeight /
            60;
    var width = MediaQuery.of(context).size.width - 2 * schedulingContext.calendarMargin;

    return Positioned(
        top: top.toDouble(),
        left: schedulingContext.hourColumnWidth + 27,
        child: Container(
            width: width,
            height: 10,
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color(0xFF718BE9),
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 3,
                    color: const Color(0xFF718BE9),
                  ),
                )
              ],
            )));
  }

}