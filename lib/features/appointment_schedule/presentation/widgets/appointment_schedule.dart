import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/hour_column.dart';

import '../../../../widgets/cards/root/entity.dart';
import '../../domain/entities/dashboard_employee_entity.dart';
import '../../presentation/widgets/daily_calendar.dart';
import '../../utils/constants.dart';

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

  Widget _horizontal() => Scrollbar(
      controller: horizontalController,
      scrollbarOrientation: ScrollbarOrientation.top,
      child: SingleChildScrollView(
          controller: horizontalController,
          scrollDirection: Axis.horizontal,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
          ])));
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
