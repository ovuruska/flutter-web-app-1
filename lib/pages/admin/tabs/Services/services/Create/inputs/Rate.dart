import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledFloatingPointInput.dart';

import '../Controller.dart';

class ServicesCreateRateInput extends StatelessWidget {
  onChanged(String? value) {
    if (value == null || value == "") {
      servicesCreateBloc.setCost("");
    } else {
      servicesCreateBloc.setCost(value);
    }
  }

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: servicesCreateBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    return ControlledFloatingPointInput(
      label: "Rate",
      onChanged: onChanged,
      value: servicesCreateBloc.value.cost.toString(),
    );
  }
}
