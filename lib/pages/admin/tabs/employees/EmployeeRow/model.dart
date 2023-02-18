

import 'package:scrubbers_employee_application/models/Branch.dart';

class AdminEmployeeTabEmployeeRowModel{

  String name = "";
  String email = "";
  String phone = "";
  Branch? branch;
  String role = "";

  setName(String name){
    this.name = name;
    return this;
  }

  setEmail(String email){
    this.email = email;
    return this;
  }

  setPhone(String phone){
    this.phone = phone;
    return this;
  }

  setBranch(Branch? branch){
    this.branch = branch;
    return this;
  }

  setRole(String role){
    this.role = role;
    return this;
  }

}