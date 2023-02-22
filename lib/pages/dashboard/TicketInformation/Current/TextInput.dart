import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';
import 'package:scrubbers_employee_application/widgets/savable_text_field.dart';

import '../Controller.dart';

class EmployeeNotesTextInput extends StatelessWidget {
  final Appointment appointment;

  const EmployeeNotesTextInput({Key? key, required this.appointment})
      : super(key: key);

  onSaved(String? value) async {
    var newAppointment = appointment.update(
      employeeNotes: value,
    );
    ticketInformationInputBloc.setAppointment(
      newAppointment,
    );
    dashboardBloc.patchAppointment(newAppointment);

    await AppointmentRepository.instance.patchAppointment(newAppointment);
  }

  Widget divider() => VerticalDivider(thickness: 2, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return SavableTextField(
      initialValue: appointment.employeeNotes,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Notes',
      ),
    );
  }
}
