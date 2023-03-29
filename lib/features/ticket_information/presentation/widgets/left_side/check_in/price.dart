import 'package:flutter/material.dart';

import '../../../../../../core/domain/entities/product_entity.dart';
import '../../appointment_context_provider.dart';
import 'utils.dart';

class TicketInformationCheckinPrice extends StatelessWidget {

  double addOnPrice(List<ProductEntity> products) {
    double price = 0;
    products.forEach((product) {
      price += product.cost;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;
    var addOn = addOnPrice(appointment.products);
    var tip = appointment.tip;
    var total =  addOn + tip;

    return Row(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              getText(text: "\$${addOn.toStringAsFixed(2)}"),
              getText(
                  text: "\$${total.toStringAsFixed(2)}",
                  color: const Color(0xFF2D7CB6)),
            ]),
      ),
    ]);
  }
}
