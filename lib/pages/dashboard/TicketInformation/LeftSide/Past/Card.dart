import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import 'Header.dart';

class TicketInformationPastCard extends StatelessWidget {
  final Appointment appointment;

  Color textColor = const Color(0xFF2D7CB6);
  Color borderColor = const Color(0xFFD3D9E4);

  TicketInformationPastCard({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var options = appointment.products.map((e) => e.name).toList();
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFD3D9E4), width: 1),
        ),
        child: Container(
            height: 128,
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(
                color: Color(0xFF989898),
                width: 8,
              ),
            )),
            padding: EdgeInsets.fromLTRB(8, 4, 16, 4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                PastAppointmentHeader(appointment: appointment),
                Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .6 - 16,
                            child: Text(appointment.employeeNotes),
                          ),
                          VerticalDivider(
                            color: Color(0xFF989898),
                          ),
                          Expanded(
                              child: Wrap(
                            children: List<Widget>.generate(
                              options.length,
                              (int idx) {
                                return ChoiceChip(
                                  selectedColor: Color(0xFFD6D8DA),
                                  label: Text(options[idx],
                                      style: TextStyle(
                                          color: Color(0xFF989898),
                                          fontWeight: FontWeight.bold)),
                                  selected: true,
                                );
                              },
                            ).toList(),
                          ))
                        ]))
              ],
            )));
  }
}
