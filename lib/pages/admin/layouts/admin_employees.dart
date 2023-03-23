

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../core/domain/entities/employee_entity.dart';
import '../../../features/app_header/presentation/widgets/header.dart';
import '../../../features/forms/employee_information_crud/presentation/bloc/employee_information_crud_bloc.dart';
import '../../../features/forms/employee_information_crud/presentation/bloc/employee_information_crud_event.dart';
import '../../../features/forms/employee_information_crud/presentation/pages/employee_information.dart';
import '../../../features/sidebars/employee_search/presentation/pages/employee_search.dart';
import '../../../injection.dart';
import '../admin_navbar.dart';
import '../admin_page_context.dart';

class AdminEmployees extends StatelessWidget {

  onSelected(EmployeeEntity employee) {
    sl<EmployeeInformationCrudBloc>().add(EmployeeInformationCrudEventSet(employee: employee));
  }

  Widget _layout(BuildContext context){
    var pageContext = AdminPageContextProvider.of(context);
    return LayoutGrid(
      columnSizes: [48.px,360.px,1.fr,1.fr,1.fr,1.fr],
      rowSizes: [48.px,240.px,1.fr],
      columnGap: 32,
      rowGap: 32,

      children: [
        AppHeader().withGridPlacement(
          rowStart: 0,
          rowSpan: 1,
          columnStart: 0,
          columnSpan: 6,
        ),
        AdminNavbar().withGridPlacement(
          rowStart: 1,
          rowSpan: 1,
          columnStart: 0,
          columnSpan: 1,
        ),
        EmployeeSearchView(
          selectEmployee: (employee) {
            onSelected(employee);
          },
        ).withGridPlacement(
          rowStart: 1,
          rowSpan: 2,
          columnStart: 1,
          columnSpan: 1,
        ),
        EmployeeInformationCrudView()
      ],

    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: _layout(context),
    );
  }
}