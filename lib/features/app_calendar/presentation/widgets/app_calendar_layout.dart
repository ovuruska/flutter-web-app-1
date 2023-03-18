import 'package:flutter/material.dart';

import '../../../../widgets/inputs/FlutterFlowCalendar.dart';
import 'app_calendar.dart';

class AppCalendarLayout extends StatelessWidget {


  const AppCalendarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF90D7FF).withOpacity(.23),
                offset: Offset(0, 4),
                blurRadius: 10,
              ),
            ],
            color: Colors.white,
          ),
          child: AppCalendar(

          )),
      Positioned(
          child: CustomIconButton(
            icon: Icon(Icons.add, color: const Color(0xFF494C68).withOpacity(.9)),
            onTap: () {},
          ),
          bottom: 0,
          right: 0)
    ]);
  }
}
