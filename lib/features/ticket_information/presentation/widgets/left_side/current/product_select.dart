import 'package:flutter/material.dart';

import '../../../../../forms/multi_product_select/presentation/pages/product_select.dart';
import '../../appointment_context_provider.dart';


class TicketInformationProductSelect extends StatefulWidget {
  @override
  _TicketInformationProductSelectState createState() =>
      _TicketInformationProductSelectState();
}

class _TicketInformationProductSelectState
    extends State<TicketInformationProductSelect> {

  @override
  Widget build(BuildContext context) {
    var notifier = AppointmentContextProvider.of(context).notifier!;
    var appointment = notifier.appointment;
    return Container(
        padding: EdgeInsets.all(16),
        height: 256,
      child:MultiProductSelectView(
        initialValue: appointment.products,
        onSelected: (value) {
          notifier.setProducts(value);
        },
      )
    );
  }
}
