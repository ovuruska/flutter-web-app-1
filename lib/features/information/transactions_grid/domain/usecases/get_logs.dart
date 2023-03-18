import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../entity/log_entity.dart';
import '../repositories/view_logs_repository.dart';

class GetLogsParams extends Equatable {
  final int id;

  GetLogsParams({required this.id});

  @override
  List<Object> get props => [id];
}

class GetLogsUseCase extends UseCase<List<LogEntity>, GetLogsParams> {
  final ViewLogsRepository repository;

  GetLogsUseCase(this.repository);

  @override
  Future<Either<Failure, List<LogEntity>>> call(GetLogsParams params) async {
    return Right((await repository.getLogs(params.id)) as List<LogEntity>);
  }
}