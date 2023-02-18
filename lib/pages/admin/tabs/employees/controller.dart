

import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';

import 'content/controller.dart';
import 'model.dart';

class AdminEmployeeTabBloc extends Bloc<AdminEmployeeTabModel>{
  AdminEmployeeTabBloc() {
    subject.add(AdminEmployeeTabModel());
  }

  setCurrentBranch(Branch? branch) {
    subject.sink.add(subject.value.setCurrentBranch(branch));
  }

  setEmployeeName(String name) {
    if(name == null) name = "";
    subject.sink.add(subject.value.setEmployeeName(name));
  }

  setEditable() {
    subject.sink.add(subject.value.setEditable());
  }

  clearEditable() {
    subject.sink.add(subject.value.clearEditable());
  }


  nextIndex() {
    var index = subject.value.currentIndex;
    index++;
    setCurrentIndex(index);

  }

  setCurrentIndex(int index){
    var totalEmployees = employeesBloc.value.employees.length;
    if(index < 0) index = totalEmployees - 1;
    else if(index > totalEmployees - 1) index = 0;

    subject.sink.add(subject.value.setCurrentIndex(index));
    var employee = employeesBloc.value.employees[index];
    onUpdate(employee);
  }

  prevIndex(){
    var index = subject.value.currentIndex;
    index--;
    setCurrentIndex(index);

  }

  Employee? get current => employeesBloc.value.employees[subject.value.currentIndex];

  onUpdate(Employee employee){
    /*
      It runs when the employee is updated in the employee bloc
     */
    adminEmployeesWeeklyScheduleBloc.fetch(int.parse(employee.id));
  }


  List<Employee> getQueryResults() {
    var employeeName = subject.value.employeeName;
    var branch = subject.value.currentBranch;

    List<Employee> filtered = [];

    for (var employee in employeesBloc.value.employees) {
      if (employeeName != "" && !employee.name.toLowerCase().contains(employeeName.toLowerCase())) continue;
      if (branch != null && employee.branch.id != branch.id) continue;
      filtered.add(employee);
    }

    return filtered;
  }

  Employee? getCurrent(){
    var index = subject.value.currentIndex;
    if(index == -1) return null;
    var employee = employeesBloc.value.employees[index];
    return employee;
  }

}

final adminEmployeeTabBloc = AdminEmployeeTabBloc();