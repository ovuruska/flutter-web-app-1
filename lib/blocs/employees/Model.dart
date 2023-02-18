

import 'package:scrubbers_employee_application/models/Employee.dart';

class EmployeesBlocModel {
  List<Employee> employees = [];

  setEmployees(List<Employee> employees) {
    this.employees = employees;
    return this;
  }

  removeEmployee(int index) {
    employees.removeAt(index);
    return this;
  }

  addEmployee(Employee employee) {
    employees.add(employee);
    return this;
  }

  updateEmployee(int index, Employee employee) {
    employees[index] = employee;
    return this;
  }

}