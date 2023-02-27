

import 'package:scrubbers_employee_application/features/modify_branch/domain/entities/branch_entity.dart';

abstract class SaveBranchRepository {

  Future<void> save(BranchEntity branch);
}