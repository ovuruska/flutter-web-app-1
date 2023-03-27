import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entity/log_entity.dart';



abstract class ViewLogsRepository {

  Future<Either<Failure,List<LogEntity>>> getLogs(int id);
}

