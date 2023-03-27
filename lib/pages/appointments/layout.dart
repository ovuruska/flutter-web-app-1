import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/app_header/presentation/widgets/header.dart';
import '../../features/sidebars/daily_column/presentation/pages/daily_column_sidebar.dart';
import '../../features/tables/appointments_page_table/presentation/pages/appointments_page_table.dart';

class AppointmentsLayout extends StatelessWidget {
  
  Widget _layout(BuildContext){
    return LayoutGrid(
        columnSizes: [
          320.px,
          1.fr,


        ],
        rowSizes: [48.px,  1.fr],
      children:[
        AppHeader().withGridPlacement(
          rowStart: 0,
          rowSpan: 1,
          columnStart: 0,
          columnSpan: 2,
        ),

        AppointmentPagesTableView().withGridPlacement(
          rowStart: 1,
          rowSpan: 1,
          columnStart: 1,
          columnSpan: 1,
        ),
        DailyColumnSidebarView().withGridPlacement(
          rowStart: 1,
          rowSpan: 1,
          columnStart: 0,
          columnSpan: 1,
        )

      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout(context),
    );
  }
}