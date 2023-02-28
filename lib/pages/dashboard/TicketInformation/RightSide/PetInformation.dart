import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'package:scrubbers_employee_application/widgets/headless_table.dart';

import '../../../../features/view_logs/presentation/pages/view_logs_dialog.dart';
import 'cells.dart';

class TicketInformationPetInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: ticketInformationInputBloc.stream,
      listener: (val) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;
    var duration = appointment.end.difference(appointment.start).inMinutes;

    return HeadlessDataTable(rows: [
      DataRow(cells: [
        boldCell("Name"),
        normalCell(StringUtils.capitalize(appointment.dog.name)),
      ]),
      DataRow(cells: [
        boldCell("Breed"),
        normalCell(StringUtils.capitalize(appointment.dog.breed)),
      ]),
      DataRow(cells: [
        boldCell("Age"),
        normalCell(StringUtils.capitalize(appointment.dog.age.toString())),
      ]),
      DataRow(cells: [
        boldCell("Weight"),
        normalCell(
            StringUtils.capitalize(appointment.dog.weight.toInt().toString())),
      ]),
      DataRow(cells: [
        boldCell("Service Time"),
        normalCell("${duration} minutes"),
      ]),
      DataRow(
        cells: [
          DataCell(
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        ViewLogsDialog(id: int.parse(appointment.id)));
              },
              child: Text("History"),
            ),
            
          ),
          DataCell(Container())
        ],
      )
    ], numberOfColumns: 2);
  }
}
