import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledCalendar.dart';

import '../../../../widgets/cards/root/entity.dart';
import '../../domain/entities/dashboard_employee_entity.dart';
import '../../presentation/widgets/daily_calendar.dart';
import '../../utils/constants.dart';
import 'hour_column.dart';

class AppointmentSchedule extends StatefulWidget {
  final DateTime date;
  final List<DashboardAppointmentEntity> appointments;
  final List<DashboardEmployeeEntity> employees;
  final int branch;

  const AppointmentSchedule(
      {Key? key,
      required this.date,
      required this.branch,
      required this.appointments,
      required this.employees})
      : super(key: key);

  @override
  _AppointmentScheduleState createState() => _AppointmentScheduleState();
}

class _AppointmentScheduleState extends State<AppointmentSchedule> {
  Widget _noemployees() => Container(
        child: Center(child: Text("No employees available.")),
      );

  Widget _ray() {
    var now = DateTime.now();
    if (!isSameDay(now, widget.date)) {
      return Container();
    }
    if(now.hour < 8 || now.hour > 20) {
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
                ...widget.employees
                    .map((employee) => DailyCalendar(
                        date: widget.date,
                        appointments: widget.appointments
                            .where((appointment) =>
                                appointment.employee == employee.id)
                            .toList(),
                        employeeName: employee.name,
                        employeeId: employee.id,
                        start: 8,
                        end: 20))
                    .toList()
              ]),
              _ray()
            ])));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.employees.isEmpty) return _noemployees();

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
