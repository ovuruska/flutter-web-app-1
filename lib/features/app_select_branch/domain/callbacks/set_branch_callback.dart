import '../entities/branch_id_and_name.dart';

abstract class AppSelectBranchSetBranchCallback {
  void call(BranchIdAndName? branch);
}