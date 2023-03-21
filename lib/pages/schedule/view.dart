import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/schedule/schedule_page_context.dart';

import '../../injection.dart';
import 'register.dart';
import 'screen_factory.dart';

class ScheduleView extends StatefulWidget {

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}
class _ScheduleViewState extends State<ScheduleView> {

  @override
  void initState(){
    registerSchedulePage(sl);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SchedulePageContextProvider(
          notifier: SchedulePageContext(
          ),
          child: ScheduleViewScreenFactory(),
        ));
  }
}
