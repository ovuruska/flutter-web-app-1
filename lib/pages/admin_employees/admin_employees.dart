import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/pages/modify_branch.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/bloc/search_branches_bloc.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import '../../features/employee_search/presentation/pages/employee_search.dart';
import '../../features/modify_branch/presentation/bloc/modify_branch_bloc.dart';
import '../../features/modify_branch/presentation/bloc/modify_branch_event.dart';
import '../../features/search_branches/presentation/bloc/search_branches_event.dart';
import '../../features/search_branches/presentation/pages/search_branches.dart';
import '../../injection.dart';
import '../../models/Branch.dart';

class AdminEmployeesTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      FlutterFlowTheme.of(context).primaryColor.withOpacity(.5),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: EmployeeSearchView(
                selectEmployee: (employee){
                },
              )),
        ],
      ),
    );
  }
}
