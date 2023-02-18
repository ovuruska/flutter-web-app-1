import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/pets/sidebar/results.dart';

import 'searchbar.dart';

class PetsSidebarView extends StatelessWidget {
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
            PetsSidebarSearchbar(),
            Expanded(child: PetsSidebarResults())
          ],
        ));
  }
}
