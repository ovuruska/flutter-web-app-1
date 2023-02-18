import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:scrubbers_employee_application/blocs/products/Controller.dart';
import 'package:scrubbers_employee_application/models/Product.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

import '../../controller.dart';

class TicketInformationProductSelect extends StatefulWidget {
  @override
  _TicketInformationProductSelectState createState() =>
      _TicketInformationProductSelectState();
}

class _TicketInformationProductSelectState
    extends State<TicketInformationProductSelect> {
  late List<Product> _products;

  @override
  void initState() {
    var appointment = ticketInformationInputBloc.value.appointment!;
    _products = appointment.products;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var products = productsBloc.value.products;

    return Container(
        padding: EdgeInsets.all(16),
        height: 256,
        child: MultiSelectDialogField<Product>(
          items: products
              .map((product) => MultiSelectItem(product, product.name))
              .toList(),
          listType: MultiSelectListType.CHIP,
          initialValue: _products,
          searchable: true,
          buttonText: const Text('Add-ons'),
          title: const Text("Add-ons"),
          onConfirm: (values) {
            setState(() {
              _products = values.cast<Product>();
              var appointment = ticketInformationInputBloc.value.appointment!;
              var newAppointment = appointment.update(
                products: _products,
              );
              ticketInformationInputBloc.setAppointment(
                newAppointment,
              );
              dashboardBloc.patchAppointment(appointment);
              AppointmentRepository.instance.patchAppointment(newAppointment);
            });
          },
        ));
  }
}
