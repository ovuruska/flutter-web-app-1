import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/analytics/client_top_category/presentation/pages/client_top_category.dart';
import '../../features/analytics/client_yearly_appointment/presentation/pages/client_yearly_appointments.dart';
import '../../features/app_header/presentation/widgets/header.dart';
import '../../features/information/client_information/presentation/pages/client_information.dart';
import '../../features/information/client_pets/presentation/pages/client_pets.dart';
import '../../features/sidebars/client_search/presentation/pages/client_search.dart';
import '../../features/tables/client_appointments_table/presentation/pages/client_appointments.dart';
import 'analytics_column.dart';

class ClientsView extends StatefulWidget {
  @override
  _ClientsViewState createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {

  Widget _layout() => LayoutGrid(
    columnSizes: [
      320.px,
      2.fr,
      2.fr,
      1.fr,
      2.fr,
      2.fr

    ],
    rowSizes: [48.px, 240.px, 1.fr],
    rowGap: 16,
    columnGap: 16,
    children: [
      AppHeader().withGridPlacement(
        rowStart: 0,
        rowSpan: 1,
        columnStart: 0,
        columnSpan: 6,
      ),
      ClientSearchView(
      ).withGridPlacement(
        rowStart: 1,
        rowSpan: 2,
        columnStart: 0,
        columnSpan: 1,
      ),
      ClientInformationView().withGridPlacement(
        rowStart: 1,
        rowSpan: 1,
        columnStart: 1,
        columnSpan: 1,
      ),
      ClientTopCategoryView().withGridPlacement(
        rowStart: 1,
        rowSpan: 1,
        columnStart: 2,
        columnSpan: 1,
      ),
      AnalyticsColumn().withGridPlacement(
        rowStart: 1,
        rowSpan: 1,
        columnStart: 3,
        columnSpan: 1,
      ),

      ClientAppointmentsView().withGridPlacement(
        rowStart: 2,
        rowSpan: 1,
        columnStart: 1,
        columnSpan:5,
      ),
      ClientPetsView().withGridPlacement(
        rowStart: 1,
        rowSpan: 1,
        columnStart: 5,
        columnSpan: 1,
      ),
      ClientYearlyAppointmentsView().withGridPlacement(
        rowStart: 1,
        rowSpan: 1,
        columnStart: 4,
        columnSpan: 1,
      ),

    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout(),
      backgroundColor: const Color(0XFFFFFFFF),
    );
  }
}