
import 'dart:developer';

import 'package:scrubbers_employee_application/services/auth.dart';

class LoginViewRepository {

  static final LoginViewRepository instance = LoginViewRepository._();

  LoginViewRepository._();

  Future<bool> login(String username, String password) async {
    var result = await SchedulingAuthService.instance.login(username, password);
    return result;
  }
}
