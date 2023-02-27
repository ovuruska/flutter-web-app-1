import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/search_branches/domain/repositories/search_branches.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

class SearchBranchesRepositoryMockImpl extends SearchBranchesRepository {

  final numberOfBranches;

  SearchBranchesRepositoryMockImpl(this.numberOfBranches);



  @override
  Future<Either<ServerFailure, List<Branch>>> getBranches() async {
    // Return 10 random branches
    List<Branch> branches = [];
    for (int i = 0; i < 10; i++) {
      branches.add(Branch(
        id: i,
        name: "Branch $i",
        address: "Address $i",
        phone: "Phone $i",
        email: "Email $i",
      ));
    }
    return Right(branches);
  }
}
