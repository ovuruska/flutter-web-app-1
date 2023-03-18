import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../repositories/employee_modify_repository.dart';

class DeleteEmployeeParams extends Equatable {
  final int id;

  const DeleteEmployeeParams({required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteEmployeeUseCase extends UseCase<void,DeleteEmployeeParams>{

  final EmployeeModifyRepository repository;

  DeleteEmployeeUseCase(this.repository);


  @override
  Future<Either<Failure, void>> call(DeleteEmployeeParams params) async {
    return await repository.delete(params.id);

  }

}