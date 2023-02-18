import 'package:scrubbers_employee_application/models/Employee.dart';

class AdminBranchesTabModel {
  int currentIndex = -1;
  bool editable = false;
  String branchName = "";

  setBranchName(String branchName) {
    this.branchName = branchName;
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
