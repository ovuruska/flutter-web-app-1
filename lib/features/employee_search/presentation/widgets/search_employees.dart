import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/employee_search/presentation/bloc/employee_search_event.dart';

import '../../../../../injection.dart';
import '../../domain/entities/employee_entity.dart';
import '../bloc/employee_search_bloc.dart';
import 'employee_list.dart';

class EmployeeSearch extends StatefulWidget {
  final List<EmployeeEntity> employees;

  final Function(EmployeeEntity)? onPressed;

  const EmployeeSearch({Key? key, required this.employees, this.onPressed}) : super(key: key);

  @override
  _EmployeeSearchState createState() => _EmployeeSearchState();
}

class _EmployeeSearchState extends State<EmployeeSearch> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: editingController,
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black38),
                  prefixIcon: Icon(Icons.search, color: Colors.black38)),
            ),
          ),
          IconButton(
            icon:const Icon(Icons.add),
            onPressed: () {
              sl<EmployeeSearchBloc>().add(CreateNewEmployeeEvent());
            },

          )

        ],
      ),
      Expanded(
        child:SingleChildScrollView(
          child: EmployeeList(
              employees: widget.employees
                  .where(
                      (element) => element.name.contains(editingController.text))
                  .toList(),
              onPressed: (branch) {
                if (widget.onPressed != null) {
                  widget.onPressed!(branch);
                }
              }),
        )
      )


    ]);
  }
}
