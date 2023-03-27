import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/employee_entity.dart';
import '../../../../../core/error/failures.dart';

abstract class PatchEmployeeRepository {
  Future<Either<Failure,EmployeeEntity>> patch(int id, Map<String, dynamic> data);
}