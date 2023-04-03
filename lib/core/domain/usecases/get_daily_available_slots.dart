import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/appointment_slot_repository.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/core/use_case.dart';

class GetDailyAvailableSlotsParams extends Equatable {
  final DateTime start;
  final List<EmployeeEntity> groomers;
  final List<BranchEntity> branches;
  final String service;

  @override
  List<Object?> get props => [start, groomers, branches, service];

  GetDailyAvailableSlotsParams({
    required this.start,
    this.groomers = const [],
    this.branches = const [],
    required this.service,
  });
}

class GetDailyAvailableSlotsUseCase
    extends UseCase<List<DailySlotEntity>, GetDailyAvailableSlotsParams> {
  final AppointmentSlotRepository repository;

  GetDailyAvailableSlotsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DailySlotEntity>>> call(
      GetDailyAvailableSlotsParams params) async {
    return await repository.getDailySlots(
      start: params.start,
      groomers: params.groomers,
      branches: params.branches,
      service: params.service,
    );
  }
}
