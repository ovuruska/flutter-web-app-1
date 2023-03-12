import 'package:flutter/material.dart';

import '../../../../widgets/cards/index.dart';
import '../../../../widgets/cards/root/entity.dart';
import '../../../../widgets/cards/wrapper.dart';
import '../../domain/entities/appointment_layout.dart';
import '../../utils/border.dart';
import '../../utils/constants.dart';
import '../../utils/layout_appointments.dart';
import '../../utils/onAcceptWithDetails.dart';
import 'appointment_card.dart';
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
        return AppointmentScheduleCard(
            layout: layout,
            start: start,
            date: date,
            employee: employeeId);
      }).toList()
    ]);
  }
}

