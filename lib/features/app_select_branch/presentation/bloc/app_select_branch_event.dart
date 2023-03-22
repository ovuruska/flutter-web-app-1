import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/branch_entity.dart';

class AppSelectBranchEvent extends Equatable {
  @override
  List<Object?> get props => [];


}

class AppSelectBranchSetBranchEvent extends AppSelectBranchEvent {
  final BranchEntity? branch;
  AppSelectBranchSetBranchEvent({required this.branch});

  @override
  List<Object?> get props => [branch];
}

class AppBranchSelectEventGetAllBranches extends AppSelectBranchEvent {}

