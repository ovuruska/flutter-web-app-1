import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/scheduling/default_context.dart';

import '../../common/scheduling/scheduling_context_provider.dart';
import 'schedule_page_context.dart';

class ScheduleViewStateProvider extends StatelessWidget {
  final Widget child;

  const ScheduleViewStateProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SchedulingContextProvider(
        schedulingContext: getDefaultSchedulingContext(),
        child: SchedulePageContextProvider(
          notifier: SchedulePageContext(),
          child: child,
        ));
  }
}
