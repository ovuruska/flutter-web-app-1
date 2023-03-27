import '../../domain/entities/branch_entity.dart';
import '../../domain/repositories/modify_branch_repository.dart';

class ModifyBranchRepositoryMockImpl extends SaveBranchRepository {
  ModifyBranchRepositoryMockImpl();

  @override
  Future<void> save(BranchEntity branch) {
    // TODO: implement modifyBranch
    throw UnimplementedError();
  }
}
