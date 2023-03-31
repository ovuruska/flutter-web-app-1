import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:scrubbers_employee_application/features/forms/branch_information_crud/domain/branch_information_updated.dart';
import 'package:scrubbers_employee_application/features/forms/branch_information_crud/presentation/bloc/branch_information_crud_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/branch_information_crud/presentation/bloc/branch_information_crud_event.dart';
import 'package:scrubbers_employee_application/features/forms/branch_information_crud/presentation/pages/branch_information.dart';
import 'package:scrubbers_employee_application/features/forms/employee_working_hours/presentation/pages/employee_working_hours.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/pages/branch_search.dart';
import 'package:scrubbers_employee_application/pages/admin/callbacks/branch_information_updated_callback_impl.dart';

import '../../../features/app_header/presentation/widgets/header.dart';
import '../../../injection.dart';
import '../admin_navbar.dart';

class AdminBranches extends StatefulWidget
{
  @override
  _AdminBranchesState createState() => _AdminBranchesState();
}

class _AdminBranchesState extends State<AdminBranches> {

  void initState(){
    super.initState();
    sl.registerLazySingleton<BranchInformationUpdatedCallback>(() => BranchInformationUpdatedCallbackImpl());
  }

  Widget _layout(BuildContext context) {
    return LayoutGrid(
      columnSizes: [48.px, 360.px, 1.fr, 1.fr, 1.fr, 1.fr],
      rowSizes: [48.px, 240.px, 1.fr],
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
        BranchSearchView(
          selectBranch: (branch) {
            sl<BranchInformationCrudBloc>().add(
              BranchInformationCrudEventSet(branch:branch),
            );
          },
        ).withGridPlacement(
          rowStart: 1,
          rowSpan: 2,
          columnStart: 1,
          columnSpan: 1,
        ),
        BranchInformationCrudView().withGridPlacement(
          rowStart: 1,
          rowSpan: 1,
          columnStart: 2,
          columnSpan: 1,
        ),
        EmployeeWorkingHoursView().withGridPlacement(
          rowStart: 2,
          rowSpan: 1,
          columnStart: 2,
          columnSpan: 2,
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _layout(context),
    );
  }
}
