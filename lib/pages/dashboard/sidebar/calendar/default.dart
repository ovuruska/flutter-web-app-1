

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledCalendar.dart';
import '../../controller.dart';
import '../../repository.dart';
import 'controller.dart';

class SidebarDefaultCalendarView extends StatelessWidget{
  @override
  Widget build(BuildContext context)  => StreamListenableBuilder(
      stream: sidebarCalendarBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    return Container(
      child:ControlledCalendar(
        weekStartsMonday: true,
        onChange: (DateTime? newSelectedDate) {
          if(newSelectedDate != null){
            sidebarCalendarBloc.setDate(newSelectedDate);
            DashboardRepository.instance.getDailyAppointments(sidebarBloc.value.currentBranch,sidebarCalendarBloc.value.selectedDate).then((value) {
              if (value != null)
                dashboardBloc.setAppointments(value);
            });
          }else{
            sidebarCalendarBloc.setDate(DateTime.now());
            DashboardRepository.instance.getDailyAppointments(sidebarBloc.value.currentBranch,sidebarCalendarBloc.value.selectedDate).then((value) {
              if (value != null)
                dashboardBloc.setAppointments(value);
            });

          }
        },
        selectedDay: sidebarCalendarBloc.value.selectedDate,
        rowHeight: 32,
        titleStyle: TextStyle(
          fontSize:14
        ),
        dayOfWeekStyle: TextStyle(),
        dateStyle: TextStyle(),
        selectedDateStyle: TextStyle(),
        inactiveDateStyle: TextStyle(),
      ),
    );
  }


}