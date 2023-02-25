import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';

class AdminEmployeeTabModel {
  String employeeName = "";
  Branch? currentBranch;
  int currentIndex = -1;
  bool editable = false;
  Employee? employee;
  List<DateTime> selectedDates = [];

  setEmployee(Employee? employee) {
    this.employee = employee;
    return this;
  }

  setSelectedDates(List<DateTime> dates) {
    selectedDates = dates;
    return this;
  }

  setCurrentBranch(Branch? branch) {
    currentBranch = branch;
    return this;
  }

  setEmployeeName(String name) {
    employeeName = name;
    return this;
  }


  setCurrentIndex(int index) {
    currentIndex = index;
    editable = false;
    return this;
  }

  setEditable() {
    this.editable = true;
    return this;
  }

  clearEditable() {
    editable = false;
    return this;
  }
}
