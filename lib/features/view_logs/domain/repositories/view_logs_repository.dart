import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/features/view_logs/domain/entity/log_entity.dart';

import '../../../../core/error/failures.dart';

abstract class ViewLogsRepository {

  Future<Either<Failure,List<LogEntity>>> getLogs(int id);
}

