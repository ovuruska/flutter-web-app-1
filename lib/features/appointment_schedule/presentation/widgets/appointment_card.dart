
import 'package:flutter/material.dart';

import '../../../../widgets/cards/index.dart';
import '../../../../widgets/cards/root/entity.dart';
import '../../../../widgets/cards/wrapper.dart';
import '../../domain/entities/appointment_layout.dart';
import '../../utils/constants.dart';
import '../../utils/onAcceptWithDetails.dart';
import 'resizable.dart';

class AppointmentScheduleCard extends StatelessWidget {

  final AppointmentLayout layout;
  final int start;
  final DateTime date;
  final int employee;

  const AppointmentScheduleCard({Key? key, required this.layout, required this.start, required this.date, required this.employee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var appointment = layout.appointment;
    var topMost = DateTime(appointment.start.year, appointment.start.month,
        appointment.start.day, start, 0, 0);
    var top = headerHeight +
        appointment.start.difference(topMost).inMinutes * boxHeight / 60;


    var leftMargin = (layout.left) * boxWidth;
    var width = (layout.right - layout.left) * boxWidth - 2 * calendarMargin;

    return Positioned(
        key: ValueKey(appointment.id),
        top: top.toDouble(),
        left: leftMargin,
        child: DragTarget<DashboardAppointmentEntity>(
            onAcceptWithDetails:
            onAcceptWithDetails(date, start, employee),
            builder: (context, appointments, builder) => DragWrapper(
                data: appointment,
                child: AppointmentScheduleResizableWrapper(
                    width: width,
                    appointment: appointment,
                    child:AppointmentCardFactory(
                      appointment: appointment,
                    )))));
  }


}