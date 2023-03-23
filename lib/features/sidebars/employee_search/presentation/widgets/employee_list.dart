

import 'package:flutter/material.dart';
import '../../../../../core/domain/entities/employee_entity.dart';
import 'employee_card.dart';

class EmployeeList extends StatelessWidget {
  final List<EmployeeEntity> employees;
  final Function(EmployeeEntity) onPressed;
  final int? selected;

  const EmployeeList({Key? key, required this.employees, required this.onPressed, this.selected})
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
            selected: selected == employee.id,
            onPressed: () => onPressed(employees[index]), employee: employee,
          );
        });
  }
}