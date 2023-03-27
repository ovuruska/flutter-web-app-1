import 'dart:ui';

import 'package:card_settings/card_settings.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/entities/employee_entity.dart';

CardSettingsSection branchSection({
  required List<BranchEntity> branches,
  Function(BranchEntity?)? onBranchSelected,
  required List<EmployeeEntity> employees,
  Function(EmployeeEntity?)? onEmployeeSelected,
}) =>
    CardSettingsSection(
        header: CardSettingsHeader(
          label: 'Branch ',
        ),
        children: <CardSettingsWidget>[
          CardSettingsListPicker<BranchEntity>(
            label: 'Branch',
            items: branches,
            initialItem: (branches.isEmpty) ? null : branches.first,
            onChanged: onBranchSelected,
          ),
          CardSettingsListPicker<EmployeeEntity>(
            label: 'Employee',
            items: employees,
            initialItem: null,
            onChanged: onEmployeeSelected,
          ),
        ]);
