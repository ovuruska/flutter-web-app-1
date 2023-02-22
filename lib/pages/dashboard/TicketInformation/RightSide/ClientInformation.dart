import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'package:scrubbers_employee_application/widgets/headless_table.dart';
import 'cells.dart';

class TicketInformationClientInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: ticketInformationInputBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    var customerDetails = ticketInformationInputBloc.value.customerDetails;
    double lifetimeInvoice = 0;
    if (customerDetails != null) {
      lifetimeInvoice = customerDetails.lifetimeProductSales +
          customerDetails.lifetimeServiceSales +
          customerDetails.lifetimeTips;
    }

    var petString = StringUtils.prettifyList(
        customerDetails?.dogs.map((e) => e.name).toList());



    return HeadlessDataTable(
      numberOfColumns: 2,
      rows: [
        DataRow(cells: [
          boldCell("Name"),
          normalCell(StringUtils.capitalize(appointment.customer.name)),
        ]),
        DataRow(cells: [
          boldCell("Lifetime invoice"),
          normalCell("\$${lifetimeInvoice.toStringAsFixed(2)}"),
        ]),
        DataRow(cells: [
          boldCell("Pets"),
          normalCell(petString),
        ]),
      ],
    );
  }
}
