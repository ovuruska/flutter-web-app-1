
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../repositories/remove_employee.dart';

class RemoveEmployeeParams {
  final int id;

  RemoveEmployeeParams({required this.id});
}

class RemoveEmployeeUseCase extends UseCase<void,RemoveEmployeeParams>{
  final RemoveEmployeeRepository repository;

  RemoveEmployeeUseCase(this.repository);

  @override
  Future<Either<Failure,void>> call(RemoveEmployeeParams params) async {
    await repository.remove(params.id);
    return Right(null);
  }

}