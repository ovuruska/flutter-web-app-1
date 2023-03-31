import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';

class BranchInformationCrudState extends Equatable {
  final BranchEntity? branch;

  BranchInformationCrudState({
    this.branch,
  });

  @override
  List<Object?> get props => [branch ?? -1];
}
