import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

import '../Controller.dart';


class EmployeeNotesTextInput extends StatefulWidget {
  _EmployeeNotesTextInputState createState() => _EmployeeNotesTextInputState();
}

class _EmployeeNotesTextInputState extends State<EmployeeNotesTextInput> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var appointment = ticketInformationInputBloc.value.appointment!;
    var employeeNotes = appointment.employeeNotes;
    setState(() {
      _textEditingController.text = employeeNotes;
    });
    focusNode.addListener(() {
      setState(() {});
      var note = _textEditingController.text;
      var newAppointment = appointment.update(
        employeeNotes: note,
      );
      ticketInformationInputBloc.setAppointment(
        newAppointment,
      );
      dashboardBloc.patchAppointment(appointment);
      AppointmentRepository.instance.patchAppointment(newAppointment);
    });
  }

  Widget divider() => VerticalDivider(thickness: 2, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Notes',
      ),
      controller: _textEditingController,
      maxLines: null,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      onChanged: (value) {},
    );
  }
}
