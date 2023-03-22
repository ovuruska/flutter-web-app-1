import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/branch_entity.dart';

class AppSelectBranchState extends Equatable {
  @override
  List<Object?> get props => [];
}


class AppSelectBranchStateLoading extends AppSelectBranchState {}

class AppSelectBranchStateLoaded  extends AppSelectBranchState {
  final List<BranchEntity> branches;
  final BranchEntity? branch;
  AppSelectBranchStateLoaded({required this.branches,this.branch  });
}
