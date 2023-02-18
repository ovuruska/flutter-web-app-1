import 'package:scrubbers_employee_application/models/Employee.dart';

class DashboardLegendModel {
  String dropdownValue = "All Employees";
  Employee? employee;

  setDropdownValue(String value) {
    dropdownValue = value;
    return this;
  }

  clearEmployee() {
    employee = null;
    return this;
  }

  setEmployee(Employee employee) {
    this.employee = employee;
    return this;
  }
}
