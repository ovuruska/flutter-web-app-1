

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../../../../models/Employee.dart';
import '../entities/employee_entity.dart';
import '../repositories/patch_employee.dart';

class PatchEmployeeParams extends Equatable {
  final int id;
  final Map<String, dynamic> employee;

  PatchEmployeeParams({
    required this.id,
    required this.employee,
  });


  @override
  List<Object> get props => [id];
}

class PatchEmployeeUseCase extends UseCase<EmployeeEntity, PatchEmployeeParams> {
  final PatchEmployeeRepository repository;

  PatchEmployeeUseCase(this.repository);

  @override
  Future<Either<Failure, EmployeeEntity>> call(PatchEmployeeParams params) async {
    return await repository.patch(params.id, params.employee);
  }
}