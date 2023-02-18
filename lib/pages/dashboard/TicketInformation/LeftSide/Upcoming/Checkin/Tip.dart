import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrubbers_employee_application/models/Product.dart';
import 'package:scrubbers_employee_application/models/Service.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';

import 'utils.dart';

class TicketInformationCheckinTip extends StatelessWidget {
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(name:"\$");

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
  Widget build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    var tip = appointment.tip;

    return Row(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getText(text: "Tip"),
            ]),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 16, 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                  height: 40,
                  width: 128,
                  child: TextFormField(
                    initialValue: _formatter.format(tip.toString()),
                    inputFormatters: <TextInputFormatter>[_formatter],
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if(value.isNotEmpty) {
                        var tip = double.parse(value.replaceAll("\$", "").replaceAll(",", ""));
                        ticketInformationInputBloc.setTip(tip);
                      }
                    },
                  ))
            ]),
      ),
    ]);
  }
}
