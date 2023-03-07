

import 'package:flutter/material.dart';
import '../../domain/entities/employee_entity.dart';
import 'employee_card.dart';

class EmployeeList extends StatelessWidget {
  final List<EmployeeEntity> employees;
  final Function(EmployeeEntity) onPressed;

  const EmployeeList({Key? key, required this.employees, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: employees.length,
        itemBuilder: (context, index) {
          var employee = employees[index];
          return EmployeeCard(
            key:Key(employee.name),
            onPressed: () => onPressed(employees[index]), employee: employee,
          );
        });
  }
}