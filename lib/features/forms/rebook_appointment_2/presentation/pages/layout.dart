

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../../appointment_schedule/presentation/pages/layout.dart';
import 'form_column.dart';

class RebookAppointment2Layout extends StatelessWidget {

  Widget layout() => LayoutGrid(
    columnSizes: [1.fr,400.px],
    rowSizes: [1.fr],
    children: [
      AppointmentScheduleLayout().withGridPlacement(
        columnStart: 0,
        rowStart: 0,
      ),
      FormColumn().withGridPlacement(
        columnStart: 1,
        rowStart: 0,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       foregroundColor: Colors.black,
       backgroundColor: const Color(0xFFF8FCFF),
       shadowColor: const Color(0xFF90D7FF).withOpacity(.23),
       title: Text('Create new appointment'),
       centerTitle: true,
     ),
      body: layout(),
   );
  }

}