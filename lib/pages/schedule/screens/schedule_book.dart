

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../features/app_header/presentation/widgets/header.dart';
import '../../../features/appointment_schedule/presentation/pages/layout.dart';
import '../../../features/forms/rebook_appointment_2/presentation/pages/rebook_appointment_2.dart';
import '../../../features/forms/rebook_appointment_2/presentation/widgets/form_column.dart';
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
          420.px,
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
          RebookAppointment2View(
          ).withGridPlacement(
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
