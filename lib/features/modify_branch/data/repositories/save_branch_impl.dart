

import 'package:scrubbers_employee_application/features/modify_branch/domain/repositories/modify_branch_repository.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/entities/branch_entity.dart';

class SaveBranchRepositoryImpl extends SaveBranchRepository {
  @override
  Future<void> save(BranchEntity branch) async {
    await SchedulingAuthService.instance.jsonRequest("/api/branch/${branch.id}", method:"PATCH", body: branch.toJson());

  }
}