import 'package:equatable/equatable.dart';

import '../../domain/entities/branch_id_and_name.dart';

class AppSelectBranchState extends Equatable {
  @override
  List<Object?> get props => [];
}


class AppBranchStateLoading extends AppSelectBranchState {}

class AppBranchStateLoaded  extends AppSelectBranchState {
  final List<BranchIdAndName> branches;
  final BranchIdAndName? branch;
  AppBranchStateLoaded({required this.branches,this.branch  });
}
