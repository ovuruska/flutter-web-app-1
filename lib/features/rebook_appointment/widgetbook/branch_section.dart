import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../domain/entities/branch_entity.dart';
import '../domain/entities/employee_entity.dart';
import '../presentation/widgets/appointment_section.dart';
import '../presentation/widgets/branch_section.dart';

@WidgetbookUseCase(name: 'Branch Section Empty', type: CardSettingsSection)
Widget branchSectionUseCase(BuildContext context) {

  return branchSection(branches: [], employees: []);
}

@WidgetbookUseCase(name: 'Branch Section Filled', type: CardSettingsSection)
Widget branchFilledUseCase(BuildContext context) {
  // Generate some dummy data
  var branches = List.generate(10, (index) => BranchEntity(id: index, name: 'Branch $index', address: 'Address $index'));
  var employees = List.generate(10, (index) => EmployeeEntity(id: index, name: 'Employee $index', role: 'Role $index'));

  return branchSection(branches: [], employees: []);
}