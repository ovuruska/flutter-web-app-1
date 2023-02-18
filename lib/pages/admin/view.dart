import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/admin/login/controller.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/view.dart';

class AdminView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminLoginBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    return AdminTabsView();
  }
}
