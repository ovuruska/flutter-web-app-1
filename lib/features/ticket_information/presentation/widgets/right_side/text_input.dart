import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';




class SpecialHandlingNotesTextInput extends StatefulWidget {
  _SpecialHandlingNotesTextInputState createState() => _SpecialHandlingNotesTextInputState();
}

class _SpecialHandlingNotesTextInputState extends State<SpecialHandlingNotesTextInput> {
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
    var appointment = AppointmentContextProvider.of(context).appointment;
    var employeeNotes = appointment.employeeNotes;
    setState(() {
      _textEditingController.text = employeeNotes;
    });
    focusNode.addListener(() {
      setState(() {});

    });
  }

  Widget divider() => VerticalDivider(thickness: 2, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      controller: _textEditingController,
      maxLines: null,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      onChanged: (value) {},
    );
  }
}
