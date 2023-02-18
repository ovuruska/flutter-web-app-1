import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledCalendar.dart';
import 'package:time_machine/time_machine.dart';
import '../../controller.dart';
import '../../repository.dart';
import 'controller.dart';

class SidebarExpandedCalendarView extends StatelessWidget{
  int interval = 1;

  @override
  Widget build(BuildContext context)  => StreamListenableBuilder(
      stream: sidebarCalendarBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));
  Widget _build(BuildContext context) {
    return Column(
      key: ValueKey("ExpandedCalendar"),
      children: List<Widget>.generate(interval*2 + 1, (index) {

        var date = LocalDate.dateTime(sidebarCalendarBloc.value.selectedDate).addMonths(index - interval).toDateTimeUnspecified();
        var decorate = date.month == sidebarCalendarBloc.value.selectedDate.month;
        return ControlledCalendar(
          key: ValueKey("ExpandedCalendar${date.month}${date.year}"),
          weekStartsMonday: true,
          onChange: (DateTime? newSelectedDate) {
            if(newSelectedDate != null){
              sidebarCalendarBloc.setDate(newSelectedDate);
              DashboardRepository.instance.getDailyAppointments(sidebarBloc.value.currentBranch,newSelectedDate).then((value) {
                if (value != null)
                  dashboardBloc.setAppointments(value);
              });            }
          },
          decorate: decorate,
          disableNavigation: true,
          selectedDay: decorate ? sidebarCalendarBloc.value.selectedDate : date,
          rowHeight: 32,
          titleStyle: TextStyle(),
          dayOfWeekStyle: TextStyle(),
          dateStyle: TextStyle(),
          selectedDateStyle: TextStyle(),
          inactiveDateStyle: TextStyle(),
        );
      })

    );
  }



}