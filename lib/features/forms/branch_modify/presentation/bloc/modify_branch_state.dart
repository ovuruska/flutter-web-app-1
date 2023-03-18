import 'package:equatable/equatable.dart';

import '../../domain/entities/branch_entity.dart';

class ModifyBranchState extends Equatable {
  const ModifyBranchState();

  @override
  List<Object> get props => [];
}

class Start extends ModifyBranchState {}

class Loading extends ModifyBranchState {}

class Updated extends ModifyBranchState {
  final BranchEntity branch;

  const Updated({required this.branch});

  @override
  List<Object> get props => [branch];
}

class SetBranch extends ModifyBranchState {
  final BranchEntity branch;

  const SetBranch({required this.branch});

  @override
  List<Object> get props => [branch];
}

class Failed extends ModifyBranchState {
  final String message;

  const Failed({required this.message});

  @override
  List<Object> get props => [message];
}

class Empty extends ModifyBranchState {}