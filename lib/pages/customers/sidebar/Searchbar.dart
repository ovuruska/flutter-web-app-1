import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../Controller.dart';

class CustomersSidebarSearchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          child: ClearableTextInput(
        label: "Search by customer name",
        hintText: "Customer name",
        onChanged: (String? value) {
          if (value != null) {
            customersViewBloc.setCustomerName(value);
          } else {
            customersViewBloc.clearCustomerName();
          }
        },
      )),
    ]));
  }
}
