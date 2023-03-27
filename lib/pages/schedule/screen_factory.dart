import 'package:flutter/material.dart';

import 'schedule_page_context.dart';
import 'screens/schedule_appointments.dart';
import 'screens/schedule_book.dart';
import 'screens/schedule_multi_calendar.dart';

class ScheduleViewScreenFactory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageContext = SchedulePageContextProvider.of(context);
    var selectedIndex = pageContext.notifier!.selectedIndex;
    if(selectedIndex == 1){
      return ScheduleMultiCalendar();
    }else if(selectedIndex == 2){
      return ScheduleBook();
    }else if(selectedIndex == 3){
      return ScheduleAppointments();
    }else{
      return ScheduleMultiCalendar();
    }

  }

}