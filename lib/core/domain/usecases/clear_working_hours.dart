import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/branch_working_hours_repository.dart';
import '../../error/failures.dart';
import '../../use_case.dart';

class ClearWorkingHoursParams {
  final IntervalEntity interval;
  final int id;

  ClearWorkingHoursParams({required this.id, required this.interval});
}

class ClearWorkingHoursUseCase extends UseCase<void, ClearWorkingHoursParams> {
  final BranchWorkingHoursRepository repository;

  ClearWorkingHoursUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ClearWorkingHoursParams params) async {
    var interval = params.interval;
    var employeeId = params.id;
    return await repository.clear(employeeId, interval);
  }
}
