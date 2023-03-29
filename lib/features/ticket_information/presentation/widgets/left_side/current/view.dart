import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'client_notes.dart';
import 'employee_notes.dart';
import 'product_select.dart';

class TicketInformationCurrentAppointmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: 192),
        width: MediaQuery.of(context).size.width * .8,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        height: 256,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF3894D7),
                              width: 12,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * .6 - 16,
                        child:
                            TicketInformationCurrentAppointmentEmployeeNotes(),
                      )),
              Container(
                width: 8,
              ),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(16),
                    height: 256,
                    child: TicketInformationProductSelect()),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: CurrentAppointmentCustomerNotes())
        ]));
  }
}
