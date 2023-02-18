import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/login/screen.dart';

import 'auto_login.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoLogin(child: LoginScreen());
  }
}
