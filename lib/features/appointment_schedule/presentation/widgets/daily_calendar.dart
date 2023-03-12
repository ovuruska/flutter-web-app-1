import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/layout_appointments.dart';

import '../../../../widgets/cards/index.dart';
import '../../../../widgets/cards/root/entity.dart';
import '../../../../widgets/cards/wrapper.dart';
import '../../domain/entities/appointment_layout.dart';
import '../../utils/border.dart';
import '../../utils/constants.dart';
import '../../utils/onAcceptWithDetails.dart';
import 'hour_box.dart';
import 'resizable.dart';



class DailyCalendar extends StatelessWidget {
  final List<DashboardAppointmentEntity> appointments;
  final DateTime date;
  final String employeeName;
  final int employeeId;
  final int start;
  final int end;

  const DailyCalendar(
      {Key? key,
      required this.appointments,
      required this.employeeName,
      required this.employeeId,
      required this.start,
      required this.end,
      required this.date})
      : super(key: key);

  Widget _buildHours(BuildContext context, List<DashboardAppointmentEntity?> t,
          List<dynamic> a) =>
      Column(
          children: List.generate(
        end - start,
        (index) => HourBox(),
      ));




  @override
  Widget build(BuildContext context) {
    List<AppointmentLayout> layouts = layoutAppointments(appointments);
    layouts.sort((a, b) => a.zIndex.compareTo(b.zIndex));
    return Stack(children: [
      Container(
          child: Column(children: [
        SizedBox(
            height: headerHeight,
            width: boxWidth,
            child: Container(
                decoration: BoxDecoration(border: border()),
                padding: EdgeInsets.all(8),
                child: Center(
                    child: Text.rich(TextSpan(
                  text: employeeName,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: ' (${appointments.length})',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xFF808FAD),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ))))),
        DragTarget<DashboardAppointmentEntity>(
            onAcceptWithDetails: onAcceptWithDetails(date, start, employeeId),
            builder: _buildHours)
      ])),
      ...layouts.map((layout) {
        var appointment = layout.appointment;
        var topMost = DateTime(appointment.start.year, appointment.start.month,
            appointment.start.day, start, 0, 0);
        var top = headerHeight +
            appointment.start.difference(topMost).inMinutes * boxHeight / 60;

        var height = (appointment.end.difference(appointment.start).inMinutes)
                    .toDouble() *
                boxHeight /
                60 -
            2 * calendarMargin;

        var leftMargin = (layout.left) * boxWidth;
        var width = (layout.right - layout.left) * boxWidth - 2 * calendarMargin;

        return Positioned(
            key: ValueKey(appointment.id),
            top: top.toDouble(),
            left: leftMargin,
            child: DragTarget<DashboardAppointmentEntity>(
                onAcceptWithDetails:
                    onAcceptWithDetails(date, start, employeeId),
                builder: (context, appointments, builder) => DragWrapper(
                    data: appointment,
                    child: AppointmentScheduleResizableWrapper(
        width: width,
        appointment: appointment,
        child:AppointmentCardFactory(
                          appointment: appointment,
                        )))));
      }).toList()
    ]);
  }
}

