
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:scrubbers_employee_application/features/client_search/presentation/widgets/client_search_loaded.dart';

import '../../features/app_header/presentation/widgets/header.dart';
import '../../features/client_search/presentation/pages/client_search.dart';

class ClientsView extends StatefulWidget {
  @override
  _ClientsViewState createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {

  Widget _layout() => LayoutGrid(
    columnSizes: [
      420.px,
      1.fr,
    ],
    rowSizes: [48.px, 120.px, 1.fr],
    rowGap: 0,
    columnGap: 0,
    children: [
      AppHeader().withGridPlacement(
        rowStart: 0,
        rowSpan: 1,
        columnStart: 0,
        columnSpan: 2,
      ),


      ClientSearchView(
      ).withGridPlacement(
        rowStart: 1,
        rowSpan: 2,
        columnStart: 0,
        columnSpan: 1,
      ),
      Container(
        color: Colors.green,
      ).withGridPlacement(
        rowStart: 1,
        rowSpan: 1,
        columnStart: 1,
        columnSpan: 1,
      ),
      Container(
        color: Colors.blue,
      ).withGridPlacement(
        rowStart: 2,
        rowSpan: 1,
        columnStart: 1,
        columnSpan: 1,
      ),

    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout(),
      backgroundColor: const Color(0xFFFAFAFA),
    );
  }
}