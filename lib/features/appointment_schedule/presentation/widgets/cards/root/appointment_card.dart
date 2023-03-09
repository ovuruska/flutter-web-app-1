import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/repositories/dashboard_appointment_entity.dart';

class AppointmentCard extends StatelessWidget {
  final DashboardAppointmentEntity appointment;
  final Color backgroundColor;
  final Color headerColor;

  const AppointmentCard(
      {Key? key,
      required this.appointment,
      required this.backgroundColor,
      required this.headerColor})
      : super(key: key);

  String _formatTime() {
    // 10-11 AM
    // 10-11:30 AM
    // 10AM-12PM
    // 10:30AM-12PM
    // 10:30AM-12:30PM
    var formatter = new DateFormat('h');
    var formatter2 = new DateFormat('a');
    if (appointment.start.minute == 0 && appointment.end.minute == 0) {
      return '${formatter.format(appointment.start)} - ${formatter.format(appointment.end)} ${formatter2.format(appointment.end)}';
    }
    if (appointment.start.minute == 0 && appointment.end.minute != 0) {
      return '${formatter.format(appointment.start)} - ${formatter.format(appointment.end)}:${appointment.end.minute} ${formatter2.format(appointment.end)}';
    }
    if (appointment.start.minute != 0 && appointment.end.minute == 0) {
      return '${formatter.format(appointment.start)}:${appointment.start.minute} - ${formatter.format(appointment.end)} ${formatter2.format(appointment.end)}';
    } else {
      return '${formatter.format(appointment.start)}:${appointment.start.minute} - ${formatter.format(appointment.end)}:${appointment.end.minute} ${formatter2.format(appointment.end)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    var duration = appointment.end.difference(appointment.start).inMinutes;
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: headerColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatTime(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Inter',
                          ),
                        ),
                        (appointment.specialHandling)
                            ? Icon(
                                Icons.star,
                                color: const Color(0xFFFFD8D8),
                              )
                            : Container(),
                        Text(
                          duration.toString() + " mins",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Inter',
                          ),
                        )
                      ],
                    )),
                Text(
                  appointment.customerName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: headerColor,
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  appointment.dogName,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF000000),
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  appointment.breed,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF989898),
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  appointment.service,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF000000),
                    fontFamily: 'Inter',
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      appointment.invoice.toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF989898),
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}