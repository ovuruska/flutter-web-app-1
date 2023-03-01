import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/view_logs/domain/entity/log_entity.dart';
import '../../../../services/auth.dart';
import '../../domain/repositories/view_logs_repository.dart';

class ViewLogsRepositoryImpl implements ViewLogsRepository {
  @override
  Future<Either<Failure, List<LogEntity>>> getLogs(int id) async {
    var response = await SchedulingAuthService.instance.request("/api/transaction/$id", method: "GET");
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);

    if (response.statusCode == 200) {

      return Right((respJson as List).map((e) => LogEntity.fromJson(e)).toList());
    } else {
      return Left(ServerFailure());
    }
  }

}