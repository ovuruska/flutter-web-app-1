

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/daily_schedule_entity.dart';
import '../entities/interval_entity.dart';
import '../repositories/working_hours_repository.dart';


class GetWorkingHoursParams{
  final int id;
  final IntervalEntity interval;

  GetWorkingHoursParams({required this.id, required this.interval});
}

class GetWorkingHoursUseCase extends UseCase<List<DailyScheduleEntity>, GetWorkingHoursParams> {
  final WorkingHoursRepository repository;

  GetWorkingHoursUseCase(this.repository);

  @override
  Future<Either<Failure, List<DailyScheduleEntity>>> call(GetWorkingHoursParams params) async {
    var employeeId = params.id;
    var interval = params.interval;
    return await repository.get(employeeId,interval);
  }
}