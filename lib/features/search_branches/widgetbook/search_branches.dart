import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../models/Branch.dart';
import '../presentation/widgets/search_branches.dart';

@WidgetbookUseCase(name: 'BranchCard', type: SearchBranches)
Widget searchUseCase(BuildContext context) {
  var branches = List.generate(
      10,
          (index) => Branch(
        id: index,
        name: 'Branch $index',
        address: 'Address $index',
        phone: 'Phone $index',
        email: 'Email $index',
      ));

  return SearchBranches(
     branches: branches,
  );
}
