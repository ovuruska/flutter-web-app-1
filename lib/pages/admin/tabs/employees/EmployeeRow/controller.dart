

import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

import 'model.dart';

class AdminEmployeeTabEmployeeRowBloc extends Bloc<AdminEmployeeTabEmployeeRowModel> {

  AdminEmployeeTabEmployeeRowBloc(){
    subject.sink.add( AdminEmployeeTabEmployeeRowModel());

  }

  setName(String name){
    subject.sink.add(subject.value.setName(name));
  }

  setPhone(String phone){
    subject.sink.add(subject.value.setPhone(phone));
  }

  setEmail(String email){
    subject.sink.add(subject.value.setEmail(email));
  }

  setRole(String role){
    subject.sink.add(subject.value.setRole(role));
  }

  setBranch(Branch? branch){
    subject.sink.add(subject.value.setBranch(branch));
  }


}

final adminEmployeeTabEmployeeRowBloc = AdminEmployeeTabEmployeeRowBloc();