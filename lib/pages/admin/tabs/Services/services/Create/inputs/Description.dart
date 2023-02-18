import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledTextInput.dart';

import '../Controller.dart';

class ServicesCreateDescriptionInput extends StatelessWidget {

  onChanged(String? value) {
    servicesCreateBloc.setDescription(value ?? "");
  }

  @override
  Widget build(BuildContext context) =>
      StreamListenableBuilder(stream: servicesCreateBloc.stream,
          listener: (value) {},
          builder: (context,snapshot) => _build(context)

  );

  Widget _build(BuildContext context) {
    return ControlledTextInput(
      label: "Description", onChanged: onChanged, maxLines: 3, value: servicesCreateBloc.value.description,);
  }


}
