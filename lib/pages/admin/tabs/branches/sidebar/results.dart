import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../../../../../models/Branch.dart';
import '../controller.dart';
import 'item.dart';

class AdminBranchesTabResults extends StatelessWidget {

  final Branch? branch;

  const AdminBranchesTabResults({Key? key, this.branch}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var currentBranch = adminBranchesTabBloc.current();
    int index = 0;
    return SingleChildScrollView(
        child: ListView(
      shrinkWrap: true,
      children: adminBranchesTabBloc
          .getQueryResults()
          .map((b) => AdminBranchesTabListItem(
              branch: b,
              index: index++,
              selected: b.id == branch?.id))
          .toList(),
    ));
  }
}
