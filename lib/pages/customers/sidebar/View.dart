import 'package:flutter/material.dart';

import 'Results.dart';
import 'Searchbar.dart';

class CustomersSidebarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          minHeight: 120,
        ),
        width: MediaQuery.of(context).size.width * .25,
        height: MediaQuery.of(context).size.height - 48,
        child: Column(
          children: [
            CustomersSidebarSearchbar(),
            Expanded(child: CustomersSidebarResults())
          ],
        ));
  }
}
