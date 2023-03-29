import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'package:scrubbers_employee_application/widgets/savable_text_field.dart';


class EmployeeNotesTextInput extends StatelessWidget {
  final AppointmentEntity appointment;

  const EmployeeNotesTextInput({Key? key, required this.appointment})
      : super(key: key);

  onSaved(String? value) async {
    var newAppointment = appointment.update(
      employeeNotes: value,
    );

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
