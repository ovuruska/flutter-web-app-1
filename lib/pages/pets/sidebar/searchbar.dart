import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../controller.dart';

class PetsSidebarSearchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          child: ClearableTextInput(
        label: "Search by dog name",
        hintText: "Dog name",
        onChanged: (String? value) {
          if (value != null) {
            petsBloc.setDogQuery(value);
          } else {
            petsBloc.clearDogQuery();
          }
        },
      )),
      Container(
          child: ClearableTextInput(
        label: "Search by customer name",
        hintText: "Customer name",
        onChanged: (String? value) {
          if (value != null) {
            petsBloc.setClientQuery(value);
          } else {
            petsBloc.clearClientQuery();
          }
        },
      )),
    ]));
  }
}
