import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../domain/entities/branch_entity.dart';
import '../domain/entities/employee_entity.dart';
import '../presentation/widgets/create_appointment_form.dart';

@WidgetbookUseCase(
    name: 'Create appointment form - Empty', type: CreateAppointmentForm)
Widget createAppointmentFormUseCase(BuildContext context) {
  return CreateAppointmentForm(branches: [], employees: [], onSubmit: (appointment) {});
}

@WidgetbookUseCase(
    name: 'Create appointment form - Filled', type: CreateAppointmentForm)
Widget createAppointmentFormFilledUseCase(BuildContext context) {
  // Generate some dummy data
  var branches = List.generate(
      10,
      (index) => BranchEntity(
          id: index, name: 'Branch $index', address: 'Address $index'));
  var employees = List.generate(
      10,
      (index) => EmployeeEntity(
          id: index, name: 'Employee $index', role: 'Role $index'));

  return CreateAppointmentForm(
    branches: branches,
    employees: employees,
    onSubmit: (appointment) {},
  );
}
