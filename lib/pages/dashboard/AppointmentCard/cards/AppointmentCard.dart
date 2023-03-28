import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentEntity appointment;
  double itemWidth;
  final Color backgroundColor;
  final Color headerBackgroundColor;
  final Widget? headerLeadItem;
  final Color headerTextColor;
  final Color customerNameColor;
  final Widget? customerRowTailItem;
  final Color dogBreedColor;
  final Color otherTextColor;

  AppointmentCard({
    Key? key,
    required this.appointment,
    this.backgroundColor = Colors.white,
    required this.itemWidth,
    this.headerBackgroundColor = const Color(0xFF3894D7),
    this.headerLeadItem,
    this.headerTextColor = Colors.white,
    this.customerNameColor = const Color(0xFF3894D7),
    this.customerRowTailItem,
    this.dogBreedColor = const Color(0x8057636C),
    this.otherTextColor = const Color(0xFF000000),
  });

  String getFormattedHourAndMinute(DateTime dateTime) {
    return DateFormat('h:mm a')
        .format(DateTime(2021, 1, 1, dateTime.hour, dateTime.minute));
  }

  Widget build(BuildContext context) {
    var duration = appointment.end.difference(appointment.start);
    var height = duration.inMinutes / 15 * 31.5;
    var difference = appointment.end.difference(appointment.start);
    TimeOfDay appointmentDuration =
        TimeOfDay(hour: difference.inHours, minute: difference.inMinutes);

    return Container(
      margin: EdgeInsets.all(2),
      height: height,
      width: itemWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText.withOpacity(.5),
          width: 1,
        ),
        color: this.backgroundColor,
      ),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: null,
          physics: NeverScrollableScrollPhysics(),
          child: SingleChildScrollView(
            controller: null,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsetsDirectional.all(4),
                      width: 254,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        color: headerBackgroundColor,
                      ),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                headerLeadItem ?? Container(),
                                Text(
                                  getFormattedHourAndMinute(appointment.start) +
                                      " - " +
                                      getFormattedHourAndMinute(
                                          appointment.end),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        color: headerTextColor,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            )),
                            Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Text(
                                  "${difference.inMinutes} minutes",
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        color: headerTextColor,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                )),
                          ])),
                  Container(height: 8),
                  Container(
                    width: itemWidth,
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            appointment.customer.name,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      color: customerNameColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          customerRowTailItem ?? Container(),
                        ]),
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 8, 0),
                  ),
                  Container(height: 4),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      appointment.dog.name,
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            color: otherTextColor,
                            fontFamily: 'Poppins',
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      appointment.dog.breed,
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            color: dogBreedColor,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(appointment.appointmentType,
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              color: otherTextColor,
                              fontFamily: 'Poppins',
                            )),
                  ),
                ]),
          )),
    );
  }

  double getTotalInvoice(AppointmentEntity appointment) {
    var totalInvoice = 0.0;
    for (var i = 0; i < appointment.services.length; i++) {
      totalInvoice += appointment.services[i].cost;
    }
    for (var i = 0; i < appointment.products.length; i++) {
      totalInvoice += appointment.products[i].cost;
    }

    totalInvoice += appointment.tip;

    return totalInvoice;
  }
}
