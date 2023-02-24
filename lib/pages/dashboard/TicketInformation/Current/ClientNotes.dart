import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/shadow.dart';

import '../Controller.dart';


class CurrentAppointmentCustomerNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    var customerNotes = appointment.customerNotes;
    return Container(

        width: MediaQuery.of(context).size.width * .8,
        height: 128,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Title(
                      color: Color(0xFF3894D7),
                      child: Text("Customer Notes",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              Padding(padding: EdgeInsets.all(8), child: Text(customerNotes))
            ]));
  }
}
