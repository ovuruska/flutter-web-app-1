
import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/data/datasources/branch/branch_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_daily_information.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';


final defaultBranches = [
  BranchEntity(id: 1, name: "Royal Oaks"),
  BranchEntity(id: 2, name: "West Bloomington"),
  BranchEntity(id: 3, name: "South Minneapolis"),
  BranchEntity(id: 4, name: "North Minneapolis"),
];

class BranchRemoteDataSourceTest extends BranchRemoteDataSource {
  List<BranchEntity> branches = defaultBranches;

  setBranches(List<BranchEntity> branches) {
    this.branches = branches;
  }

  @override
  Future<Either<Failure, List<BranchEntity>>> getBranches() async {
    return Right(branches);
  }

  @override
  Future<Either<Failure, BranchDailyInformationEntity>> getDailyInformation(int branchId, DateTime date) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BranchEntity>> patch(BranchEntity branch) {
    // TODO: implement getBranch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BranchEntity>> getBranch(int id) {
    // TODO: implement getBranch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BranchEntity>> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure,void>>  remove(int id) {
    // TODO: implement remove
    throw UnimplementedError();
  }


}
