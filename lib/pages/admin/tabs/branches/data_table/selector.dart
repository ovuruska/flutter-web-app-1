

import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/controller.dart';

final getBranchEmployees = () {
  if(adminBranchesTabBloc.value.currentIndex == -1) {
    return <Employee>[];
  }else {
    var branch = branchesBloc.value.branches[adminBranchesTabBloc.value.currentIndex];
    return employeesBloc.value.employees.where((employee) => employee.branch.id == branch.id).toList();
  }
} ;