

import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/blocs/customers/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import '../Controller.dart';
import 'ListItem.dart';

class CustomersSidebarResults extends StatelessWidget{
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(stream: customersViewBloc.stream, listener: (value){}, builder: (context, value) => _build(context));
  Widget _build(BuildContext context) {
    var currentIndex = customersViewBloc.value.currentIndex;
    var selectedCustomer = customersBloc.value.customers[currentIndex];
    return SingleChildScrollView(
        child:ListView(
          shrinkWrap: true,
          children: customersViewBloc.getQueryResults().map<Widget>((customer) => CustomersSidebarListItem(customer:customer,selected: customer.id == selectedCustomer.id)).toList(),
        )

    );
  }
}