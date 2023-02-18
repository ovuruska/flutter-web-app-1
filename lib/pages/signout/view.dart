

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

class SignoutView extends StatefulWidget {


  @override
  _SignoutViewState createState() => _SignoutViewState();

}

class _SignoutViewState extends State<SignoutView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SchedulingAuthService.instance.logout();
      context.pushNamed("Login");
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container();
  }
}