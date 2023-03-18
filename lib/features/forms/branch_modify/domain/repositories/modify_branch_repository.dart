



import '../entities/branch_entity.dart';

abstract class SaveBranchRepository {

  Future<void> save(BranchEntity branch);
}