import 'package:flutter/material.dart';


import '../../features/forms/employee_modify/presentation/bloc/employee_modify_bloc.dart';
import '../../features/forms/employee_modify/presentation/bloc/employee_modify_event.dart';
import '../../features/forms/employee_modify/presentation/pages/employee_modify.dart';
import '../../features/forms/employee_working_hours/presentation/bloc/working_hours_bloc.dart';
import '../../features/forms/employee_working_hours/presentation/bloc/working_hours_event.dart';
import '../../features/forms/employee_working_hours/presentation/pages/employee_working_hours.dart';
import '../../features/sidebars/employee_search/presentation/bloc/employee_search_bloc.dart';
import '../../features/sidebars/employee_search/presentation/bloc/employee_search_event.dart';
import '../../features/sidebars/employee_search/presentation/pages/employee_search.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../injection.dart';
import '../../features/sidebars/employee_search/domain/entities/employee_entity.dart' as employee_search;

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
                      children: [
                        EmployeeModifyView(
                          onRemoved: (employee) {
                            sl<EmployeeSearchBloc>()
                                .add(RemoveEmployeeEvent(id:employee.id));
                            sl<EmployeeWorkingHoursBloc>()
                                .add(PurgeWorkingHoursEvent());
                          },
                          onSaved: (employee) {
                            sl<EmployeeSearchBloc>()
                                .add(PatchEmployeeEvent(employee: employee_search.EmployeeEntity(id: employee.id, name: employee.name)));
                          },
                        ),
                        Container(
                          height: 96,
                        ),

                        EmployeeWorkingHoursView()
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
