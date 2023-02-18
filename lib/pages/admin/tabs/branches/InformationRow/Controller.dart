

import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

import 'Model.dart';

class AdminBranchesTabInformationRowBloc extends Bloc<AdminBranchesTabInformationRowModel> {

  AdminBranchesTabInformationRowBloc(){
    subject.sink.add( AdminBranchesTabInformationRowModel());

  }

  setName(String name){
    subject.sink.add(subject.value.setName(name));
  }

  setPhone(String phone){
    subject.sink.add(subject.value.setPhone(phone));
  }

  setEmail(String address){
    subject.sink.add(subject.value.setAddress(address));
  }

  setDescription(String description){
    subject.sink.add(subject.value.setDescription(description));
  }

  setAddress(String address){
    subject.sink.add(subject.value.setAddress(address));
  }



}

final adminBranchesTabInformationRowBloc = AdminBranchesTabInformationRowBloc();