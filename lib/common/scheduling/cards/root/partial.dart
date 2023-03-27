import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_context_provider.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/constants.dart';

class AppointmentCardPartial extends StatelessWidget {
  final Color backgroundColor = const Color(0xFFFCF9FF);
  final Color headerColor = const Color(0xFFAB87C8);

  final double? width;
  final double? height;
  // Partial card, so we don't need to pass in the entire appointment
  final DateTime? start;
  final DateTime? end;
  final bool? specialHandling;
  final String? customerName;
  final String? service;
  final String? dogName;
  final String? breed;

  const AppointmentCardPartial(
      {Key? key,
      this.width,
      this.start,
      this.end,
      this.specialHandling = false,
      this.height,
      this.customerName,
      this.service,
      this.dogName,
      this.breed})
      : super(key: key);

  String _formatTime() {
    if (start == null || end == null) return '';
    var formatter = new DateFormat('h');
    var formatter2 = new DateFormat('a');
    if (start!.minute == 0 && end!.minute == 0) {
      return '${formatter.format(start!)} - ${formatter.format(end!)} ${formatter2.format(end!)}';
    }
    if (start!.minute == 0 && end!.minute != 0) {
      return '${formatter.format(start!)} - ${formatter.format(end!)}:${end!.minute} ${formatter2.format(end!)}';
    }
    if (start!.minute != 0 && end!.minute == 0) {
      return '${formatter.format(start!)}:${start!.minute} - ${formatter.format(end!)} ${formatter2.format(end!)}';
    } else {
      return '${formatter.format(start!)}:${start!.minute} - ${formatter.format(end!)}:${end!.minute} ${formatter2.format(end!)}';
    }
  }

  String _duration() {
    if (start == null || end == null) return '';
    var duration = end!.difference(start!).inMinutes;
    return '$duration mins';
  }

  bool _specialHandling() {
    if (specialHandling == null) return false;
    return specialHandling!;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: EdgeInsets.all(calendarMargin),
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
                        width: boxWidth,
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
                                    (_specialHandling())
                                        ? Icon(
                                            Icons.star,
                                            color: const Color(0xFFFFD8D8),
                                          )
                                        : Container(),
                                    Text(
                                      _duration(),
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
                                customerName ?? "",
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
                                dogName ?? "",
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
                                breed ?? "",
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
                                service ?? "",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color(0xFF000000),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                ))));
  }
}

/*


 */
