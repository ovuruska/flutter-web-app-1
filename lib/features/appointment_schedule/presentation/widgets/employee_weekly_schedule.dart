import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/common/scheduling/current_time_ray.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_daily_calendar_column.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_hour_column.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/on_accept_with_details.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledCalendar.dart';

import '../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../common/scheduling/scheduling_context_provider.dart';
import '../../domain/entities/dashboard_employee_entity.dart';

class EmployeeWeeklySchedule extends StatefulWidget {
  final DateTime date;
  final List<SchedulingAppointmentEntity> appointments;
  final DashboardEmployeeEntity employee;

  const EmployeeWeeklySchedule({
    Key? key,
    required this.date,
    required this.employee,
    required this.appointments,
  }) : super(key: key);

  @override
  _EmployeeWeeklyScheduleState createState() => _EmployeeWeeklyScheduleState();
}

class _EmployeeWeeklyScheduleState extends State<EmployeeWeeklySchedule> {

  Widget _noemployees() => Container(
        child: Center(child: Text("No employees available.")),
      );

  List<DateTime> getWeekDays(DateTime date) {
    var startOfWeek = date.startOfWeek();
    var endOfWeek = date.endOfWeek();
    var days = <DateTime>[];
    while (startOfWeek.isBefore(endOfWeek)) {
      days.add(startOfWeek);
      startOfWeek = startOfWeek.add(Duration(days: 1));
    }
    return days;
  }

  List<Widget> dayColumns(BuildContext context,DateTime date){
    var schedulingContext = SchedulingContextProvider.of(context);

    var weekDays = getWeekDays(widget.date);
    // 24 January 2023, Wednesday
    var formatter = DateFormat('EEEE, d MMMM yyyy');
    return weekDays
        .map((current) => SchedulingDailyCalendarColumn(
      onAccept: onAcceptWithEmployee(context),
        date: current,
        appointments: widget.appointments
            .where((appointment) => appointment.start.isSameDay( current))
            .toList(),
        header: formatter.format(current),
        employeeId: widget.employee.id))
    .toList();

  }

  Widget _horizontal(BuildContext context) {
    var schedulingContext = SchedulingContextProvider.of(context);
    return Scrollbar(
        controller: schedulingContext.horizontalController,
        scrollbarOrientation: ScrollbarOrientation.top,
        child: SingleChildScrollView(
            controller: schedulingContext.horizontalController,
            scrollDirection: Axis.horizontal,
            child: Stack(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: SchedulingHourColumn(
                    )),
                ...dayColumns(context,widget.date)
              ]),
              CurrentTimeRay()
            ])));
  }



  @override
  Widget build(BuildContext context) {
    var schedulingContext = SchedulingContextProvider.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      extendBody: true,
      body: SingleChildScrollView(
        controller: schedulingContext.verticalController,
        child: _horizontal(context),
      ),
    );
  }
}
