import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';

class EmployeeDropdown extends StatelessWidget {
  final Employee? value;
  final Function(Employee?) onChanged;
  bool disabled;

  EmployeeDropdown({required this.value, required this.onChanged,this.disabled=false});

  @override
  Widget build(BuildContext context) {
    var employees = employeesBloc.value.employees;
    return Container(
        child:DropdownButton<Employee?>(

      value: value,
      onChanged: (disabled) ? null : (Employee? newValue) {
        onChanged(newValue);
      },
      items: employees.map<DropdownMenuItem<Employee>>((Employee value) {
        return DropdownMenuItem<Employee>(
          value: value,
          child:Text(value.name),
        );
      }).toList(),
    ));
  }
}
