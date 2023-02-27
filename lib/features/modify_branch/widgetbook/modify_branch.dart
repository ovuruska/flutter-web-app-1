import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_event.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

import '../../../injection.dart';
import '../../../models/Branch.dart';
import '../presentation/pages/modify_branch.dart';

@WidgetbookUseCase(name: 'ModifyBranch', type: ModifyBranch)
Widget modifyBranchUseCase(BuildContext context) {
  var branch = Branch(
    id: 1,
    name: 'Branch 1',
    address: 'Address 1',
    phone: 'Phone 1',
    email: 'Email 1',
  );
  sl<ModifyBranchBloc>().add(SetBranchEvent(branch: branch));

  return ModifyBranch();
}
