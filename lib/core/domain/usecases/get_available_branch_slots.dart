import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/appointment_slot_repository.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/core/use_case.dart';

class GetAvailableBranchSlotsParams extends Equatable {
  final DateTime start;
  final List<int> groomers;
  final List<int> branches;
  final String service;

  @override
  List<Object?> get props => [start, groomers, branches, service];

  GetAvailableBranchSlotsParams({
    required this.start,
    this.groomers = const [],
    this.branches = const [],
    required this.service,
  });
}

class GetAvailableBranchSlotsUseCase
    extends UseCase<List<DailySlotEntity>, GetAvailableBranchSlotsParams> {
  final AppointmentSlotRepository repository;

  GetAvailableBranchSlotsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DailySlotEntity>>> call(
      GetAvailableBranchSlotsParams params) async {
    return await repository.getDailySlots(
      start: params.start,
      groomers: params.groomers,
      branches: params.branches,
      service: params.service,
    );
  }
}
