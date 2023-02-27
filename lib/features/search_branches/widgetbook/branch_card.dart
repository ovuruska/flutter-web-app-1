import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../models/Branch.dart';
import '../presentation/widgets/branch_card.dart';

@WidgetbookUseCase(name: 'BranchCard', type: BranchCard)
Widget branchCardUseCase(BuildContext context) {
  var branch = Branch(
    id: 1,
    name: 'Branch 1',
    address: 'Address 1',
    phone: 'Phone 1',
    email: 'Email 1',
  );
  return BranchCard(
    branch: branch,
    onPressed: () {},
  );
}
