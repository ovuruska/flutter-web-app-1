import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../models/Branch.dart';
import '../presentation/widgets/branch_list.dart';

@WidgetbookUseCase(name: 'BranchCard', type: BranchList)
Widget branchListUseCase(BuildContext context) {
  var branches = List.generate(
      10,
      (index) => Branch(
            id: index,
            name: 'Branch $index',
            address: 'Address $index',
            phone: 'Phone $index',
            email: 'Email $index',
          ));

  return BranchList(
    branches: branches, onPressed: (Branch ) {  },
  );
}
