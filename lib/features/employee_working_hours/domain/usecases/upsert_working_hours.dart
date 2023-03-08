import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../core/usecases/use_case.dart';
import '../entities/daily_schedule_entity.dart';
import '../repositories/working_hours_repository.dart';

class UpsertWorkingHoursParams extends Equatable {
  final List<DailyScheduleEntity> workingHours;
  final int id;
  UpsertWorkingHoursParams({required this.workingHours, required this.id});

  @override
  List<Object?> get props => [];
}

class UpsertWorkingHoursUseCase
    extends UseCase<void, UpsertWorkingHoursParams> {
  final WorkingHoursRepository repository;

  UpsertWorkingHoursUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpsertWorkingHoursParams params) async {
    var workingHours = params.workingHours;
    var employeeId = params.id;
    return await repository.upsert(employeeId,workingHours);
  }
}
