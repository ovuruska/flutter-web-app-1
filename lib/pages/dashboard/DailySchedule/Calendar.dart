
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import '../constants.dart';
import '../utils.dart';

class DashboardDailyScheduleCalendar extends StatelessWidget {
  DashboardDailyScheduleCalendar({Key? key, required this.employee})
      : super(key: key);
  Employee employee;

  final int totalSlices = 4 * 12 + 1;

  

  @override
  Widget build(BuildContext context) {
    return DragTarget<AppointmentEntity>(
      builder: (context, candidateData, rejectedData) => _build(context),
      onAcceptWithDetails: acceptWithEmployee(employee),
    );
  }

  Widget _build(BuildContext context) {
    return SizedBox(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              border: Border.all(
                color:Colors.black.withOpacity(.5),
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                        height: 48,

                        width: itemWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Text(employee.name)],
                        ))
                  ] +
                  List<Widget>.generate(
                      totalSlices,
                          (index) => Divider(
                        thickness:  (index % 4 == 0 ) ? 1 : .5,
                        color: (index % 4 == 0 || index % 4 == 2) ?FlutterFlowTheme.of(context).primaryText.withOpacity(.5) : Colors.transparent,
                      )),
            )));
  }
}
