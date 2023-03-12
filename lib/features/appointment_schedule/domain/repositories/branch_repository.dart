


import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/dashboard_employee_entity.dart';

abstract class BranchEmployeesRepository {
  Future<Either<Failure, List<DashboardEmployeeEntity>>> getBranchEmployees(int branchId,DateTime date);
}