import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Services/services/Create/Controller.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledIntegerInput.dart';

class ServicesCreateDurationInput extends StatelessWidget {
  onChanged(String? value) {
    if (value == null || value == "") {
      servicesCreateBloc.setDuration("");
    } else {
      servicesCreateBloc.setDuration(value);
    }
  }


  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: servicesCreateBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    return ControlledIntegerInput(label: "Duration", onChanged: onChanged, value: servicesCreateBloc.value.duration.toString());
  }
}
