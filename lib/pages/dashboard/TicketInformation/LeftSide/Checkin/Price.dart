import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Product.dart';
import 'package:scrubbers_employee_application/models/Service.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';

import '../../../../../common/StreamListenableBuilder.dart';
import 'utils.dart';

class TicketInformationCheckinPrice extends StatelessWidget {
  double basePrice(List<ServiceModel> services) {
    double price = 0;
    services.forEach((service) {
      price += service.cost;
    });
    return price;
  }

  double addOnPrice(List<Product> products) {
    double price = 0;
    products.forEach((product) {
      price += product.cost;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: ticketInformationInputBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));
  Widget _build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    var base = basePrice(appointment.services);
    var addOn = addOnPrice(appointment.products);
    var tip = appointment.tip;
    var total = base + addOn + tip;

    return Row(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getText(text: "Base Price"),
              getText(text: "Add-ons"),
              getText(text: "Service Total", color: const Color(0xFF2D7CB6)),
            ]),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              getText(text: "\$${base.toStringAsFixed(2)}"),
              getText(text: "\$${addOn.toStringAsFixed(2)}"),
              getText(
                  text: "\$${total.toStringAsFixed(2)}",
                  color: const Color(0xFF2D7CB6)),
            ]),
      ),
    ]);
  }
}
