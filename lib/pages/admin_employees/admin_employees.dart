import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/employee_working_hours/presentation/bloc/working_hours_bloc.dart';
import 'package:scrubbers_employee_application/features/employee_working_hours/presentation/bloc/working_hours_event.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/pages/modify_branch.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/bloc/search_branches_bloc.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import '../../features/employee_modify/presentation/bloc/employee_modify_bloc.dart';
import '../../features/employee_modify/presentation/bloc/employee_modify_event.dart';
import '../../features/employee_modify/presentation/pages/employee_modify.dart';
import '../../features/employee_search/presentation/pages/employee_search.dart';
import '../../features/employee_working_hours/presentation/pages/employee_working_hours.dart';
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
                selectEmployee: (employee) {
                  sl<EmployeeWorkingHoursBloc>()
                      .add(SetEmployeeEvent(id: employee.id));
                  sl<EmployeeModifyBloc>()
                      .add(EmployeeModifySetEvent(id: employee.id));
                },
              )),
          Expanded(
              flex: 4,
              child: Container(
                height: double.infinity,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                child: Column(
                  children: [EmployeeModifyView(), EmployeeWorkingHoursView()],
                ),
              )))
        ],
      ),
    );
  }
}
