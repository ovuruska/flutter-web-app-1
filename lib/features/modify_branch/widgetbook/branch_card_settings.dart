

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/widgets/branch_card_settings.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../../../flutter_flow/flutter_flow_util.dart';
import '../domain/entities/branch_entity.dart';

@WidgetbookUseCase(name: 'BranchCardSettings', type: BranchCardSettings)
Widget branchCardSettingsUseCase(BuildContext context) {
  var branch = BranchEntity(
    id: 1,
    name: 'Branch 1',
    address: 'Address 1',
    phone: 'Phone 1',
    email: 'Email 1',
  );
  return BranchCardSettings(branch: branch, onSaved: (Branch ) {
    showSnackbar(context, 'Branch is saved.');
  },
  onRemoved: (Branch ) {
    showSnackbar(context, 'Branch is removed.');
  }
  );
}
