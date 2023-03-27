import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/employee_information_crud_bloc.dart';
import '../bloc/employee_information_crud_state.dart';
import '../widgets/employee_information.dart';

class EmployeeInformationCrudView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeInformationCrudBloc,
        EmployeeInformationCrudState>(
      bloc: sl<EmployeeInformationCrudBloc>(),
      builder: (context, state) {
        return state.employee != null
            ? EmployeeInformationCrud(
                key: ValueKey<int>(state.employee!.id),
                employee: state.employee!)
            : Container(
                child: Center(
                  child: Text('No employee selected'),
                ),
              );
      },
    );
  }
}
