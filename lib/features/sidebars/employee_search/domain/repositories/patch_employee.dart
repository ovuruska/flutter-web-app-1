import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/employee_entity.dart';

abstract class PatchEmployeeRepository {
  Future<Either<Failure,EmployeeEntity>> patch(int id, Map<String, dynamic> data);
}