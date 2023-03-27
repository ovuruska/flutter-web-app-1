

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment_slot_entity.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../use_case.dart';
import '../entities/branch_entity.dart';
import '../entities/employee_entity.dart';
import '../repositories/appointment_slot_repository.dart';

class GetAvailableSlotsParams extends Equatable{

  final DateTime start;
  final List<EmployeeEntity> groomers;
  final List<BranchEntity> branches;
  final String service;
  final int duration;

  GetAvailableSlotsParams({
    required this.start,
    this.groomers = const [],
    this.branches = const [],
    required this.service,
    required this.duration
  });

  @override
  List<Object?> get props => [start, groomers, branches, service, duration];
}


class GetAvailableSlotsUseCase extends UseCase<List<AppointmentSlotEntity>,GetAvailableSlotsParams>{
  final AppointmentSlotRepository repository;

  GetAvailableSlotsUseCase(this.repository);
  @override
  Future<Either<Failure, List<AppointmentSlotEntity>
  >> call(GetAvailableSlotsParams params) async {
    return await repository.getAvailableSlots(
      start: params.start,
      groomers: params.groomers,
      branches: params.branches,
      service: params.service,
      duration: params.duration,
    );
  }

}