import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/constants.dart';

import 'entity.dart';

class AppointmentCard extends StatelessWidget {
  final DashboardAppointmentEntity appointment;
  final Color backgroundColor;
  final Color headerColor;
  final double? width;

  const AppointmentCard(
      {Key? key,
      required this.appointment,
      required this.backgroundColor,
      this.width,
      required this.headerColor})
      : super(key: key);

  String _formatTime() {
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
    var height = duration * boxHeight / 60 - 2 * calendarMargin;
    var width = boxWidth - 2*calendarMargin;
    return Container(
      margin:EdgeInsets.all(calendarMargin),
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: SingleChildScrollView(
            controller: null,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
                controller: null,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: width,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: headerColor,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            Container(height: 8),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(
                                appointment.customerName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: headerColor,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(
                                appointment.dogName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color(0xFF000000),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(
                                appointment.breed,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color(0xFF989898),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(
                                appointment.service,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color(0xFF000000),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(left:4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              appointment.invoice.toStringAsFixed(0) + "\$",
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color(0xFF989898),
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ))
                  ],
                ))));
  }
}

/*


 */
