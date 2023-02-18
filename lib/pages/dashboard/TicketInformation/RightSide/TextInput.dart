import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

import '../../controller.dart';
import '../Controller.dart';


// TODO: Refactor this code as a component.
// On focus change, event handler will be given to the widget.

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
    var appointment = ticketInformationInputBloc.value.appointment!;
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
