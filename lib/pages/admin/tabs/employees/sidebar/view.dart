import 'package:flutter/material.dart';

import 'results.dart';
import 'search_bar.dart';

class AdminEmployeeTabSidebarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
        ),
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.fromLTRB(8, 8, 8, 8),
              child:            AdminEmployeeTabSearchbar(),

            ),
            Expanded(child: AdminEmployeeTabResults())
          ],
        ));
  }
}
