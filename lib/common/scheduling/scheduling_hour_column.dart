import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'scheduling_context_provider.dart';

class SchedulingHourColumn extends StatelessWidget {
  static String getFormattedHour(int hour) {
    return DateFormat('hh a').format(DateTime(2021, 1, 1, hour));
  }

  @override
  Widget build(BuildContext context) {
    var schedulingContext = SchedulingContextProvider.of(context);
    return Container(
      child: Column(
        children: [
          for (int i = schedulingContext.startHour; i <= schedulingContext.numberOfHours + schedulingContext.startHour; i++)
            Container(
              height: schedulingContext.hourColumnHeight.toDouble(),
              child: Row(
                children: [
                  Container(
                    width: schedulingContext.hourColumnWidth,
                    child: Text(getFormattedHour(i),),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
