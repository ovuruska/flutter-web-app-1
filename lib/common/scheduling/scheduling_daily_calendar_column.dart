import 'package:flutter/material.dart';

import 'models/scheduling_appointment_entity.dart';
import 'appointment_card_item.dart';
import 'models/scheduling_appointment_layout.dart';
import 'layout_appointments.dart';
import 'scheduling_border.dart';
import 'scheduling_context_provider.dart';
import 'scheduling_hour_box.dart';

class SchedulingDailyCalendarColumn extends StatelessWidget {
  final List<SchedulingAppointmentEntity> appointments;
  final DateTime date;
  final String header;
  final int employeeId;
  final int start;
  final int end;
  final Function(SchedulingAppointmentEntity)? onLocalUpdate;
  final Function(SchedulingAppointmentEntity)? onRemoteUpdate;
  final Function(DragTargetDetails<SchedulingAppointmentEntity>) Function(
      DateTime, int, int)? onAccept;

  const SchedulingDailyCalendarColumn(
      {Key? key,
        required this.appointments,
        required this.header,
        required this.employeeId,
        required this.start,
        required this.end,
        required this.date,
        this.onAccept,
        this.onLocalUpdate,
        this.onRemoteUpdate
      }) : super(key: key);

  Widget _buildHours(BuildContext context, List<SchedulingAppointmentEntity?> t,
          List<dynamic> a) =>
      Column(
          children: List.generate(
        end - start,
        (index) => SchedulingHourBox(),
      ));

  @override
  Widget build(BuildContext context) {
    List<SchedulingAppointmentLayout> layouts = layoutAppointments(appointments);
    layouts.sort((a, b) => a.zIndex.compareTo(b.zIndex));

    var schedulingContext = SchedulingContextProvider.of(context);
    return Stack(children: [
      Column(children: [
        SizedBox(
            height: schedulingContext.headerHeight,
            width: schedulingContext.boxWidth,
            child: Container(
                decoration: BoxDecoration(border: border()),
                padding: EdgeInsets.all(8),
                child: Center(
                    child: Text.rich(TextSpan(
                  text: header,
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
        DragTarget<SchedulingAppointmentEntity>(
            onAcceptWithDetails: onAccept == null ? null :onAccept!(date, start, employeeId),
            builder: _buildHours)
      ]),
      ...layouts.map((layout) {
        return AppointmentScheduleCard(
          onAccept: onAccept,
          onRemoteUpdate: onRemoteUpdate,
          onLocalUpdate: onLocalUpdate,
          layout: layout,
          start: start,
          date: date,
          employee: employeeId,
        );
      }).toList()
    ]);
  }
}
