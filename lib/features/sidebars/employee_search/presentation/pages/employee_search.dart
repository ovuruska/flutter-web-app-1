import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';


import '../../../../../injection.dart';
import '../../domain/entities/employee_entity.dart';
import '../bloc/employee_search_bloc.dart';
import '../bloc/employee_search_event.dart';
import '../bloc/employee_search_state.dart';
import '../widgets/search_employees.dart';

class EmployeeSearchView extends StatefulWidget {

  final Function(EmployeeEntity)? selectEmployee;

  const EmployeeSearchView({Key? key, this.selectEmployee}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EmployeeSearchViewState();
  }
}

class _EmployeeSearchViewState extends State<EmployeeSearchView> {

  int ?selected;

  @override
  void initState() {
    super.initState();
    sl<EmployeeSearchBloc>().add(GetEmployeesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeSearchBloc, EmployeeSearchState>(
      bloc: sl<EmployeeSearchBloc>(),
      builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          var employees = state.employees;
          return EmployeeSearch(
            selected: selected,
            employees: employees,
            onPressed: (employee) {
              setState(() {
                selected = employee.id;
              });
              if (widget.selectEmployee != null) {
                widget.selectEmployee!(employee);

              }
            },
          );
        }else if(state is Failed){
          showSnackbar(context,state.message);
          return Center(child: Text(state.message),);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
