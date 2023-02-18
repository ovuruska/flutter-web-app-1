import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Services/services/Create/inputs/button/Create.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Services/services/Create/inputs/button/Save.dart';

import '../../Controller.dart';

class ServicesActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: servicesCreateBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var isCreate = servicesCreateBloc.value.editMode == false;
    if (isCreate) {
      return ServicesCreateButton();
    } else {
      return ServicesSaveButton();
    }
  }
}
