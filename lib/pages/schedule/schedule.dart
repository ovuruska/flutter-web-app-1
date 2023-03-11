import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/app_header/presentation/widgets/header.dart';
import '../../features/appointment_schedule/presentation/pages/appointment_schedule.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  Widget _grid() => LayoutGrid(
        columnSizes: [
          64.px,
          420.px,
          1.fr,
          16.px,
        ],
        rowSizes: [
          48.px,
          360.px,
          1.fr,
          72.px
        ],
    rowGap: 16,
    columnGap: 16,
    children: [
      AppHeader().withGridPlacement(
        rowStart: 0,
        rowSpan: 1,
        columnStart: 0,
        columnSpan: 4,
      ),
    ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _grid(),
      backgroundColor: const Color(0xFFFAFAFA),
    );
  }
}
