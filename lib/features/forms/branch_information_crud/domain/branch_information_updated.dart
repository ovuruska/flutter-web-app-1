import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';


abstract class BranchInformationUpdatedCallback{
  void call(BranchEntity branchEntity);
}