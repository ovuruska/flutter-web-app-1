import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';

import '../../../../../models/Branch.dart';


@immutable
class SearchBranchesEvent extends Equatable {
  const SearchBranchesEvent();

  @override
  List<Object> get props => [];
}

class SearchBranchesEventPatch extends SearchBranchesEvent {
  final BranchEntity branch;

  SearchBranchesEventPatch({required this.branch});

  @override
  List<Object> get props => [branch];
}

class SearchBranchesEventCreate extends SearchBranchesEvent {

  SearchBranchesEventCreate();

  @override
  List<Object> get props => [];
}
class SearchBranchesEventRemove extends SearchBranchesEvent {
  final int id;

  SearchBranchesEventRemove({required this.id});

  @override
  List<Object> get props => [id];
}

class SearchBranchesEventGetBranches extends SearchBranchesEvent {

  SearchBranchesEventGetBranches();

  @override
  List<Object> get props => [];
}

class SearchBranchesEventSetBranches extends SearchBranchesEvent {
  final List<BranchEntity> branches;

  SearchBranchesEventSetBranches({required this.branches});

  @override
  List<Object> get props => [branches];
}