import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/app_header/presentation/widgets/header.dart';

class AppointmentsLayout extends StatelessWidget {
  
  Widget _layout(BuildContext){
    return LayoutGrid(
        columnSizes: [
          320.px,
          1.fr,
          1.fr,
          1.fr,
          1.fr,
          1.fr

        ],
        rowSizes: [48.px, 240.px, 1.fr],
      children:[
        AppHeader().withGridPlacement(
          rowStart: 0,
          rowSpan: 1,
          columnStart: 0,
          columnSpan: 6,
        ),


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