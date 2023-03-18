

import '../../../../../services/auth.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/repositories/modify_branch_repository.dart';

class SaveBranchRepositoryImpl extends SaveBranchRepository {
  @override
  Future<void> save(BranchEntity branch) async {
    await SchedulingAuthService.instance.jsonRequest("/api/branch/${branch.id}", method:"PATCH", body: branch.toJson());

  }
}