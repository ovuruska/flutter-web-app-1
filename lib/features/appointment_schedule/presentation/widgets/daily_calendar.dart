import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/drag_target_box.dart';

import '../../../../widgets/cards/index.dart';
import '../../../../widgets/cards/root/entity.dart';
import '../../../../widgets/cards/wrapper.dart';
import '../../utils/border.dart';
import '../../utils/constants.dart';

class DailyCalendar extends StatelessWidget {
  final List<DashboardAppointmentEntity> appointments;
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
      required this.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ...List.generate(
            end - start,
            (index) =>
                DragTargetBox(start:start, employeeId: employeeId)),
      ])),
      ...appointments.map((appointment) {
        var topMost = DateTime(appointment.start.year, appointment.start.month,
            appointment.start.day, start, 0, 0);
        var top = headerHeight +
            appointment.start.difference(topMost).inMinutes * boxHeight / 60;

        var height = (appointment.end
                        .difference(appointment.start)
                        .inMinutes)
                    .toDouble() *
                boxHeight /
                60 -
            2 * calendarMargin;
        return Positioned(
            key: ValueKey(appointment.id),
            top: top.toDouble(),
            child: DragWrapper(
                data: appointment,
                child: Container(
                    margin: EdgeInsets.all(calendarMargin),
                    height: height,
                    width: boxWidth - 2 * calendarMargin,
                    child: AppointmentCardFactory(
                      appointment: appointment,
                    ))));
      }).toList()
    ]);
  }
}
