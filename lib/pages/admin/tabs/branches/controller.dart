import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

import 'content/controller.dart';
import 'model.dart';

class AdminBranchesTabBloc extends Bloc<AdminBranchesTabModel> {
  AdminBranchesTabBloc() {
    subject.add(AdminBranchesTabModel());
  }

  Branch? current(){
    var index = subject.value.currentIndex;
    if(index == -1) return null;
    return branchesBloc.value.branches[index];
  }

  nextIndex() {
    var index = subject.value.currentIndex;
    index++;
    setCurrentIndex(index);
  }

  Branch? getCurrentBranch() => (subject.value.currentIndex == -1)
      ? null
      : branchesBloc.value.branches[subject.value.currentIndex];

  setEditable() {
    subject.sink.add(subject.value.setEditable());
  }

  clearEditable() {
    subject.sink.add(subject.value.clearEditable());
  }

  setBranchName(String branchName) {
    subject.sink.add(subject.value.setBranchName(branchName));
  }

  setCurrentIndex(int index) {
    var totalBranches = branchesBloc.value.branches.length;
    if (index < 0)
      index = totalBranches - 1;
    else if (index > totalBranches - 1) index = 0;

    subject.sink.add(subject.value.setCurrentIndex(index));
    onUpdate(branchesBloc.value.branches[index]);
  }

  prevIndex() {
    var index = subject.value.currentIndex;
    index--;
    setCurrentIndex(index);

  }
  onUpdate(Branch? branch) {
    adminBranchesWeeklyScheduleBloc.fetch(branch!.id);

  }



  List<Branch> getQueryResults() {
    var query = subject.value.branchName;
    var branches = branchesBloc.value.branches;
    var results = branches
        .where(
            (branch) => branch.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return results;
  }
}

final adminBranchesTabBloc = AdminBranchesTabBloc();
