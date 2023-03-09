import 'package:flutter/material.dart';

import '../../domain/repositories/dashboard_appointment_entity.dart';

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
      required this.employeeId, required this.start, required this.end})
      : super(key: key);


  Border _border() => Border(
    bottom: BorderSide(
      color: const Color(0xFFD9D9D9),
      width: 1,
    ),
    left: BorderSide(
      color: const Color(0xFFD9D9D9),
      width: 1,
    ),
    right: BorderSide(
      color: const Color(0xFFD9D9D9),
      width: 1,
    ),

  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
              Container(
                height:60,
                  decoration:BoxDecoration(border: _border()),
                  width: 256,
                  padding: EdgeInsets.all(8),
                  child: Center(
                      child:Text.rich(
                    TextSpan(
                      text:employeeName,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' (${appointments.length})',
                          style: TextStyle(
                            fontSize: 12,
                            color:const Color(0xFF808FAD),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    )

                  )
              )),
              ...List.generate(
                end-start,
                  (index) => Container(
                    height: 60,
                    decoration:BoxDecoration(
                      border:_border(),
                    ),
                    width: 256,
                    padding: EdgeInsets.all(8),
                  )

              ),

            ]));
  }
}
