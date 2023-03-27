import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../entities/interval_entity.dart';
import '../repositories/working_hours_repository.dart';

class ClearWorkingHoursParams {
  final IntervalEntity interval;
  final int id;

  ClearWorkingHoursParams({required this.id, required this.interval});
}

class ClearWorkingHoursUseCase extends UseCase<void, ClearWorkingHoursParams> {
  final WorkingHoursRepository repository;

  ClearWorkingHoursUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ClearWorkingHoursParams params) async {
    var interval = params.interval;
    var employeeId = params.id;
    return await repository.clear(employeeId, interval);
  }
}
