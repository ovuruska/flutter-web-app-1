import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

class BranchInformationCrudEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BranchInformationCrudEventGet extends BranchInformationCrudEvent {
  final int id;

  BranchInformationCrudEventGet({required this.id});

  @override
  List<Object?> get props => [id];
}

class BranchInformationCrudEventSet extends BranchInformationCrudEvent {
  final BranchEntity branch;
  BranchInformationCrudEventSet({required this.branch});

  @override
  List<Object?> get props => [branch];
}

class BranchInformationCrudEventPatch extends BranchInformationCrudEvent {
  final BranchEntity branch;
  BranchInformationCrudEventPatch({required this.branch});

  @override
  List<Object?> get props => [branch];
}
