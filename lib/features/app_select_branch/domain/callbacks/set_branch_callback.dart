import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';

abstract class AppSelectBranchSetBranchCallback {
  void call(BranchEntity? branch);
}