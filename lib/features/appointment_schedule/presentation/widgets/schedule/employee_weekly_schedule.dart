import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledCalendar.dart';

import '../../../../../widgets/cards/root/entity.dart';
import '../../../domain/entities/dashboard_employee_entity.dart';
import '../../../utils/constants.dart';
import '../daily_calendar.dart';
import '../hour_column.dart';

class EmployeeWeeklySchedule extends StatefulWidget {
  final DateTime date;
  final List<DashboardAppointmentEntity> appointments;
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

  Widget _ray() {
    var now = DateTime.now();
    if (now.hour < 8 || now.hour > 20) {
      return Container();
    }
    var top = headerHeight +
        now
                .difference(DateTime(now.year, now.month, now.day, 8, 0, 0))
                .inMinutes *
            boxHeight /
            60;
    var width = MediaQuery.of(context).size.width - 2 * calendarMargin;

    return Positioned(
        top: top.toDouble(),
        left: hourWidth + 27,
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

  List<Widget> dayColumns(DateTime date){
    var weekDays = getWeekDays(widget.date);
    // 24 January 2023, Wednesday
    var formatter = DateFormat('EEEE, d MMMM yyyy');
    return weekDays
        .map((current) => DailyCalendar(
        date: widget.date,
        appointments: widget.appointments
            .where((appointment) => isSameDay(appointment.start, current))
            .toList(),
        header: formatter.format(current),
        employeeId: widget.employee.id,
        start: 8,
        end: 20))
    .toList();

  }

  Widget _horizontal() {

    return Scrollbar(
        controller: horizontalController,
        scrollbarOrientation: ScrollbarOrientation.top,
        child: SingleChildScrollView(
            controller: horizontalController,
            scrollDirection: Axis.horizontal,
            child: Stack(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: HourColumn(
                      start: 8,
                      end: 20,
                    )),
                ...dayColumns(widget.date)
              ]),
              _ray()
            ])));
  }

  Widget _nobranch() => Container(
        child: Center(child: Text("No branch selected.")),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      extendBody: true,
      body: SingleChildScrollView(
        controller: verticalController,
        child: _horizontal(),
      ),
    );
  }
}
