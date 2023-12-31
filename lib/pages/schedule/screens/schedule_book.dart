

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../features/app_header/presentation/widgets/header.dart';
import '../../../features/appointment_schedule/presentation/pages/layout.dart';
import '../../../features/forms/rebook_appointment_2/presentation/pages/rebook_appointment_2.dart';
import '../navbar.dart';
import '../schedule_page_context.dart';

class ScheduleBook extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var pageContext = SchedulePageContextProvider.of(context);
    var isFullScreen = pageContext.notifier!.isFullScreen;

    return Scaffold(
      body: LayoutGrid(
        columnSizes: [
          64.px,
          320.px,
          1.fr,
          16.px,
        ],
        rowSizes: [48.px, 480.px, 1.fr,16.px],
        rowGap: 16,
        columnGap: 16,
        children: [
          AppHeader().withGridPlacement(
            rowStart: 0,
            rowSpan: 1,
            columnStart: 0,
            columnSpan: 4,
          ),

          ScheduleNavbar().withGridPlacement(
            rowStart: 1,
            rowSpan: 2,
            columnStart: 0,
            columnSpan: 1,
          ),
          AppointmentScheduleLayout().withGridPlacement(
            rowStart: 1,
            rowSpan: 2,
            columnStart: 2 - (isFullScreen ? 1 : 0),
            columnSpan: 1 + (isFullScreen ? 1 : 0),
          ),
          (isFullScreen) ? Container() :
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: const Color(0xFFFFFFFF),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF90D7FF).withOpacity(.23),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child:RebookAppointment2View(
          )).withGridPlacement(
            rowStart: 1,
            rowSpan: 2,
            columnStart: 1,
            columnSpan: 1,
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFFFFF),
    );
  }
}
