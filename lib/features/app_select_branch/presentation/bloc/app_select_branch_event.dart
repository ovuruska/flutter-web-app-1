

import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/entities/branch_id_and_name.dart';

class AppSelectBranchEvent extends Equatable {
  @override
  List<Object?> get props => [];


}

class AppSelectBranchSetBranchEvent extends AppSelectBranchEvent {
  final BranchIdAndName? branch;
  AppSelectBranchSetBranchEvent({required this.branch});

  @override
  List<Object?> get props => [branch];
}

class GetAllBranchesEvent extends AppSelectBranchEvent {}

