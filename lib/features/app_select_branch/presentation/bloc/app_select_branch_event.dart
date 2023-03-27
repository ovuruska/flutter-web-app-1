import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/branch_entity.dart';

class AppSelectBranchEvent extends Equatable {
  @override
  List<Object?> get props => [];


}

class AppSelectBranchEventSetBranch extends AppSelectBranchEvent {
  final BranchEntity? branch;
  AppSelectBranchEventSetBranch({required this.branch});

  @override
  List<Object?> get props => [branch];
}

class AppSelectBranchEventGetAll extends AppSelectBranchEvent {}

class AppSelectBranchEventSetId extends AppSelectBranchEvent {
  final int id;
  AppSelectBranchEventSetId({required this.id});

  @override
  List<Object?> get props => [id];
}