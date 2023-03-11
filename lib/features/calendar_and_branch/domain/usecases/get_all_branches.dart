

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/calendar_and_branch/domain/entities/branch_id_and_name.dart';

import '../../../../core/usecases/use_case.dart';
import '../repositories/branch_repository.dart';

class GetAllBranchesUseCase extends UseCase<List<BranchIdAndName>,NoParams>{

  final CalendarAndBranchRepository repository;

  GetAllBranchesUseCase(this.repository);



  @override
  Future<Either<Failure, List<BranchIdAndName>>> call(NoParams params) async {
    return await repository.getBranches();
  }

}