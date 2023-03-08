import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/employee_entity.dart';
import '../repositories/employee_modify_repository.dart';

class GetEmployeeParams extends Equatable {
  final int id;

  GetEmployeeParams({required this.id});

  @override
  List<Object> get props => [id];
}

class GetEmployeeUseCase extends UseCase<EmployeeEntity, GetEmployeeParams> {
  final EmployeeModifyRepository repository;

  GetEmployeeUseCase(this.repository);

  @override
  Future<Either<Failure,EmployeeEntity>> call(GetEmployeeParams params) async {
    var response = await repository.get(params.id);
    return response;
  }
}