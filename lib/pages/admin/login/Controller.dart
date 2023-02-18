

import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/pages/admin/login/Model.dart';

class AdminLoginBloc extends Bloc<AdminLoginModel>{
  AdminLoginBloc() {
    subject.sink.add(AdminLoginModel());
  }

  setEmail(String email) {
    subject.sink.add(subject.value.setEmail(email));
  }

  setPassword(String password) {
    subject.sink.add(subject.value.setPassword(password));
  }

  signIn() {
    subject.sink.add(subject.value.setSignedIn(true));
  }

  signOut() {
    subject.sink.add(subject.value.setSignedIn(false));
  }
}

final adminLoginBloc = AdminLoginBloc();