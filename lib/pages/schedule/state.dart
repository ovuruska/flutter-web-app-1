import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/scheduling/default_context.dart';

import '../../common/scheduling/scheduling_context_provider.dart';
import '../../injection.dart';
import 'schedule_page_context.dart';

class ScheduleViewStateProvider extends StatefulWidget {
  final Widget child;

  const ScheduleViewStateProvider({Key? key, required this.child})
      : super(key: key);

  @override
  _ScheduleViewStateProviderState createState() =>
      _ScheduleViewStateProviderState();
}
class _ScheduleViewStateProviderState extends State<ScheduleViewStateProvider> {

  final SchedulePageContext _schedulePageContext = SchedulePageContext();
  void initState() {
    super.initState();
    sl.registerLazySingleton(() => _schedulePageContext);
  }

  @override
  Widget build(BuildContext context) {
    return SchedulingContextProvider(
        schedulingContext: getDefaultSchedulingContext(),
        child: SchedulePageContextProvider(
          notifier: _schedulePageContext,
          child: widget.child,
        ));
  }
}
