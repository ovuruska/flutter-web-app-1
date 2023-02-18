import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/shadow.dart';

import 'ClientNotes.dart';
import 'EmployeeNotes.dart';
import 'ProductSelect.dart';

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
              ShadowContainer(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      ))),
              Container(
                width: 8,
              ),
              Expanded(
                  child: ShadowContainer(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(16),
                    height: 256,
                    child: TicketInformationProductSelect()),
              )),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: CurrentAppointmentCustomerNotes())
        ]));
  }
}
