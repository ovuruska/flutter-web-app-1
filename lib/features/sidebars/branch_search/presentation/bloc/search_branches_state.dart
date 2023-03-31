import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';


class SearchBranchesState extends Equatable {
  const SearchBranchesState();

  @override
  List<Object> get props => [];
}

class Start extends SearchBranchesState {}

class Loading extends SearchBranchesState {}

class Loaded extends SearchBranchesState {
  final List<BranchEntity> branches;

  const Loaded({required this.branches});

  @override
  List<Object> get props => [branches];
}

class Failed extends SearchBranchesState {
  final String message;

  const Failed({required this.message});

  @override
  List<Object> get props => [message];
}

class Empty extends SearchBranchesState {}
