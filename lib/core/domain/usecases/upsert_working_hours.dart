import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/branch_working_hours_repository.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../use_case.dart';
import '../../../features/forms/branch_working_hours/domain/entities/branch_schedule_entity.dart';

class UpsertWorkingHoursParams extends Equatable {
  final List<BranchScheduleEntity> workingHours;
  final int id;
  UpsertWorkingHoursParams({required this.workingHours, required this.id});

  @override
  List<Object?> get props => [];
}

class UpsertWorkingHoursUseCase
    extends UseCase<void, UpsertWorkingHoursParams> {
  final BranchWorkingHoursRepository repository;

  UpsertWorkingHoursUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpsertWorkingHoursParams params) async {
    var workingHours = params.workingHours;
    var employeeId = params.id;
    return await repository.upsert(employeeId,workingHours);
  }
}
