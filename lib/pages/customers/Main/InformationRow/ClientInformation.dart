import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/customers/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/customers/Controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';
import 'package:scrubbers_employee_application/pages/pets/controller.dart';

import 'wrappers.dart';

class CustomersMainInformationRowClientInformation extends StatelessWidget {
  double _lifetimeInvoice(String? clientId) {
    var total = 0.0;
    if (clientId == null) {
      return total;
    }
    for (var appointment in sidebarBloc.value.calendarAppointments) {
      if (appointment.customer.id == clientId) {
        for (var service in appointment.services) {
          total += service.cost;
        }
        for (var product in appointment.products) {
          total += product.cost;
        }
        total += appointment.tip;
      }
    }
    return total;
  }

  String prettyPrint(List<String> data) {
    if (data.length == 0) {
      return "N/A";
    } else if (data.length == 1) {
      return data[0];
    } else {
      return data.sublist(0, data.length - 1).join(", ") + " and " + data.last;
    }
  }

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: customersViewBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var currentIndex = customersViewBloc.value.currentIndex;
    var owner = customersBloc.value.customers[currentIndex];
    var clientId = owner.id;
    var clientName = owner.name;
    var clientPhone = owner.phone;
    var clientEmail = owner.email;
    var pets = petsBloc.value.pets
            ?.where((pet) => pet.owner.id == clientId)
            .map((pet) => pet.name)
            .toList() ??
        [];

    var totalInvoice = _lifetimeInvoice(clientId);

    return Row(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          boldText("Client Id"),
          boldText("Client Name"),
          boldText("Client Email"),
          boldText("Client Phone"),
          boldText("Total invoice"),
          boldText("Pets")
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          infoText(clientId),
          infoText(clientName),
          infoText(clientEmail),
          infoText(clientPhone),
          infoText(totalInvoice.toStringAsFixed(2)),
          infoText(prettyPrint(pets))
        ])
      ],
    );
  }
}
