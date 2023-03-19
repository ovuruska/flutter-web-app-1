import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case.dart';
import '../entities/employee_entity.dart';
import '../repositories/get_employees_repository.dart';

class GetEmployeesParams extends Equatable {
  final int branchId;

  GetEmployeesParams({required this.branchId});

  @override
  List<Object> get props => [branchId];
}

class GetEmployeesUseCase
    extends UseCase<List<EmployeeEntity>, GetEmployeesParams> {
  final GetEmployeesRepository employeeRepository;
  GetEmployeesUseCase(this.employeeRepository);

  @override
  Future<Either<Failure, List<EmployeeEntity>>> call(
      GetEmployeesParams params) async {
    return await employeeRepository.getEmployees(params.branchId);
  }
}
