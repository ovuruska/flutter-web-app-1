import '../../models/Branch.dart';

class BranchesModel {
  List<Branch> branches = [];

  setBranches(List<Branch> branches) {
    this.branches = branches;
    return this;
  }

  updateBranch(int index,Branch branch) {
    try {
      branches[index] = branch;
    } catch (err) {
      print(err);
    } finally {
      return this;
    }
  }

  addBranch(Branch branch) {
    branches.add(branch);
    return this;
  }

  removeBranch(int index){
    branches.removeAt(index);
    return this;
  }

}
