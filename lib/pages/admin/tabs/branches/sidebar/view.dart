import 'package:flutter/material.dart';

import 'results.dart';
import 'searchbar.dart';

class AdminBranchesTabSidebarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Flex(
            direction: Axis.vertical,
          children: [
            Padding(
              padding:EdgeInsets.fromLTRB(8, 8, 8, 8),
              child:            AdminBranchesTabSearchbar(),

            ),
            Expanded(child: AdminBranchesTabResults())
          ],
        ));
  }
}