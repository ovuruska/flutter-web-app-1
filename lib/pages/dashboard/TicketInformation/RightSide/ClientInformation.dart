import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';

class TicketInformationClientInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(stream: ticketInformationInputBloc.stream, listener: (value){}, builder: (context, snapshot) => _build(context));
  
  Widget _build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    var customerDetails = ticketInformationInputBloc.value.customerDetails;
    double lifetimeInvoice = 0;
    if(customerDetails != null){
      lifetimeInvoice = customerDetails.lifetimeProductSales + customerDetails.lifetimeServiceSales + customerDetails.lifetimeTips;
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Client Information',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF2D7CB6),
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Color(0xFFD9D9D9),
            height: 8,
            endIndent: 16,
          ),
          Flex(direction: Axis.horizontal, children: [
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name:",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                Container(height: 4),
                Text(
                  "Lifetime Invoice:",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(height: 4),
                Text(
                  "Pets:",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.customer.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(height: 4),
                Text(
                  "\$"+lifetimeInvoice.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(height: 4),
                Text(
                  StringUtils.prettifyList(customerDetails?.dogs.map((e) => e.name).toList() ?? []),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )
              ],
            )),
          ])
        ],
      ),
    );
  }
}
