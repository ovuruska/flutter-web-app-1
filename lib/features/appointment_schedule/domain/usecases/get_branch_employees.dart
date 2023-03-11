

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/repositories/branch_repository.dart';

import '../../../../core/usecases/use_case.dart';

class GetBranchEmployeesParams extends Equatable {
  final DateTime date;
  final int branch;

  GetBranchEmployeesParams({
    required this.date,
    required this.branch,
  });

  @override
  List<Object> get props => [date, branch];
}

class GetBranchEmployeesUseCase extends UseCase<List<DashboardEmployeeEntity>,GetBranchEmployeesParams>{
  final BranchEmployeesRepository branchEmployeesRepository;

  GetBranchEmployeesUseCase(this.branchEmployeesRepository);

  @override
  Future<Either<Failure, List<DashboardEmployeeEntity>>> call(GetBranchEmployeesParams params) async {
    return await branchEmployeesRepository.getBranchEmployees(params.branch, params.date);
  }

}