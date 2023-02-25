import 'package:flutter/material.dart';

import '../../../../../common/StreamListenableBuilder.dart';
import '../../Branches/controller.dart';
import 'results.dart';
import 'searchbar.dart';

class AdminBranchesTabSidebarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,

      builder: (context, value) => _build(context));
  Widget _build(BuildContext context) {

    var branch = adminBranchesTabBloc.current();
    return Container(

        child: Flex(
            direction: Axis.vertical,
          children: [
            Padding(
              padding:EdgeInsets.fromLTRB(8, 8, 8, 8),
              child:            AdminBranchesTabSearchbar(),

            ),
            Expanded(child: AdminBranchesTabResults(branch: branch))
          ],
        ));
  }
}
