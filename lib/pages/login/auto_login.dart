import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

class AutoLogin extends StatefulWidget {
  final Widget child;

  const AutoLogin({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AutoLoginState();
  }
}

class _AutoLoginState extends State<AutoLogin> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var isLoggedIn = SchedulingAuthService.instance.isLogged();

      if (isLoggedIn) context.pushNamed("Dashboard");
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
