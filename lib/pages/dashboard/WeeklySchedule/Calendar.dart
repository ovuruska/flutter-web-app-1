import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/Legend/Controller.dart';

import '../constants.dart';
import '../utils.dart';

class DashboardWeeklyScheduleCalendar extends StatelessWidget {
  DashboardWeeklyScheduleCalendar({Key? key, required this.date})
      : super(key: key);
  DateTime date;

  final int totalSlices = 4 * 12 + 1;

  getDateString(DateTime dateTime) {
    return DateFormat('EEEE, d MMM, yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var employee = dashboardLegendBloc.value.employee!;
    return DragTarget<Appointment>(
      builder: (context, candidateData, rejectedData) => _build(context),
      onAcceptWithDetails: acceptWithDateAndEmployee(employee, date),
    );
  }

  Widget _build(BuildContext context) {
    return SizedBox(
        child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(1),
              border: Border.all(
                color: Colors.black.withOpacity(.5),
                width: .5,
              ),
            ),
            width: itemWidth,
            height: totalSlices * 32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F5FA),
                        ),
                        height: 48,
                        width: itemWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Text(getDateString(date))],
                        ))
                  ] +
                  List<Widget>.generate(
                      totalSlices,
                      (index) => Divider(
                            thickness: (index % 4 == 0) ? 2 : .5,
                            color: (index % 4 == 0 || index % 4 == 2)
                                ? FlutterFlowTheme.of(context)
                                    .primaryText
                                    .withOpacity(.5)
                                : Colors.transparent,
                          )),
            )));
  }
}
