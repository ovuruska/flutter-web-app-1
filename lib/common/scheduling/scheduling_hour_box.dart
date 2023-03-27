import 'package:flutter/material.dart';
import 'scheduling_border.dart';
import 'scheduling_context_provider.dart';

class SchedulingHourBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var schedulingContext = SchedulingContextProvider.of(context);

    return SizedBox(
        width: schedulingContext.boxWidth,
        height: schedulingContext.boxHeight,
        child: Container(
          decoration: BoxDecoration(
            border: border(),
          ),
          padding: EdgeInsets.all(8),
        ));
  }

}