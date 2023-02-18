import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/blocs/employees/Model.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:uuid/uuid.dart';

import '../../common/Bloc.dart';

class EmployeesBloc extends Bloc<EmployeesBlocModel> {
  EmployeesBloc() {
    subject.add(EmployeesBlocModel());
  }

  setEmployees(List<Employee> employees) {
    subject.sink.add(subject.value.setEmployees(employees));
  }

  removeEmployee(int index) {
    subject.sink.add(subject.value.removeEmployee(index));
  }

  createEmployee() {
    var branch;
    if (branchesBloc.value.branches.isNotEmpty)
      branch = branchesBloc.value.branches[0];
    else
      branch = Branch.empty();
    var uuid = Uuid();

    var employee = Employee(
        id: uuid.v4().substring(0,8),
        name: '',
        phone: '',
        email: '',
        role: 'We Wash',
        uid: '',
        branch: branch);
    subject.sink.add(subject.value.addEmployee(employee));
    return employee;
  }
  addEmployee(Employee employee) {
    subject.sink.add(subject.value.addEmployee(employee));
  }



  updateEmployee(int index,
      {String? name,
      String? phone,
      String? email,
      String? role,
      Map<DateTime, int>? weeklyProgram,
      Branch? branch}) {


    var employee = Employee(
        id: subject.value.employees[index].id,
        name: name ?? subject.value.employees[index].name,
        phone: phone ?? subject.value.employees[index].phone,
        email: email ?? subject.value.employees[index].email,
        role: role ?? subject.value.employees[index].role,
        uid: subject.value.employees[index].uid,
        values: weeklyProgram ?? subject.value.employees[index].weeklyProgram.toMap(),
        branch: branch ?? subject.value.employees[index].branch);

    subject.sink.add(subject.value.updateEmployee(index, employee));
    return employee;
  }
}

final employeesBloc = EmployeesBloc();
