

import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/pages/login/model.dart';
import 'package:scrubbers_employee_application/pages/login/repository.dart';

class LoginViewBloc extends Bloc<LoginViewModel>{
  LoginViewBloc(){
    subject.sink.add(LoginViewModel());
  }

  setUsername(String username){
    subject.sink.add(value.setUsername(username));
  }

  setPassword(String password){
    subject.sink.add(value.setPassword(password));
  }

  login() async {
    LoginViewRepository.instance.login(value.username, value.password);
  }
}

final loginViewBloc = LoginViewBloc();