


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/constants.dart';

class HourColumn extends StatelessWidget {

  final int start;
  final int end;

  const HourColumn({Key? key, required this.start, required this.end}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // 11 AM
    var formatter = new DateFormat('h a');
    return Container(
      width: hourWidth,
      child: Column(
        children: List.generate(
          end - start,
              (index) {
                return Container(
                  height: boxHeight,

                  child: Center(
                    child: Text(
                      formatter.format(DateTime(2021, 1, 1, start + index)),
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xFF989898),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                );
              }
        )
      ),
    );
  }
  
}