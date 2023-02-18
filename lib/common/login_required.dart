import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/signout/view.dart';

import '../services/auth.dart';

class LoginRequired extends StatelessWidget {
  final Widget child;

  const LoginRequired(this.child) : super();

  @override
  Widget build(BuildContext context) {
    var isLoggedIn = SchedulingAuthService.instance.isLogged();
    if (!isLoggedIn) {
      return SignoutView();
    }
    return child;
  }
}
