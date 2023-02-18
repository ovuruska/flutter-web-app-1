import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../Controller.dart';
import 'ListItem.dart';

class AdminBranchesTabResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: branchesBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => StreamListenableBuilder(
          stream: adminBranchesTabBloc.stream,
          listener: (value) {},
          builder: (context, value) => _build(context)));

  Widget _build(BuildContext context) {
    var currentBranch = adminBranchesTabBloc.getCurrentBranch();
    int index = 0;

    return SingleChildScrollView(
        child: ListView(
      shrinkWrap: true,
      children: adminBranchesTabBloc
          .getQueryResults()
          .map((branch) => AdminBranchesTabListItem(
              branch: branch,
              index: index++,
              selected: branch.id == currentBranch?.id))
          .toList(),
    ));
  }
}
