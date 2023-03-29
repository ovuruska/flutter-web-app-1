import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';
import 'package:scrubbers_employee_application/widgets/headless_table.dart';

import '../../../../information/transactions_grid/presentation/pages/view_logs_dialog.dart';
import '../../../utils/contants.dart';

class TicketInformationPetInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;
    var duration = appointment.end.difference(appointment.start).inMinutes;
    var pet = appointment.pet;
    var birth = pet.birth.toString() ?? "";
    return HeadlessDataTable(rows: [
      DataRow(cells: [
        boldCell("Name"),
        normalCell(StringUtils.capitalize(pet.name)),
      ]),
      DataRow(cells: [
        boldCell("Breed"),
        normalCell(StringUtils.capitalize(pet.breed)),
      ]),
      DataRow(cells: [
        boldCell("Age"),
        normalCell(StringUtils.capitalize(birth)),
      ]),
      DataRow(cells: [
        boldCell("Weight"),
        normalCell(
            StringUtils.capitalize(appointment.pet.weight.toInt().toString())),
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
                        ViewLogsDialog(id: appointment.id));
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
