import 'package:scrubbers_employee_application/blocs/branches/Model.dart';
import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

class BranchesBloc extends Bloc<BranchesModel> {
  BranchesBloc() {
    subject.sink.add(BranchesModel());
  }

  setBranches(List<Branch> branches) {
    subject.sink.add(subject.value.setBranches(branches));
  }

  Branch updateBranch(
    int index, {
    String? name,
    String? description,
    String? phone,
    String? address,
  }) {
    var branch = subject.value.branches[index];

    var newBranch = Branch(
        id: branch.id,
        name: name ?? branch.name,
        address: address ?? branch.address,
        description: description ?? branch.description,
        phone: phone ?? branch.phone);
    subject.sink.add(subject.value.updateBranch(index, newBranch));
    return newBranch;
  }



  addBranch(Branch branch) {
    subject.sink.add(subject.value.addBranch(branch));
  }

  removeBranch(int index){
    subject.sink.add(subject.value.removeBranch(index));
  }

}

final branchesBloc = BranchesBloc();
