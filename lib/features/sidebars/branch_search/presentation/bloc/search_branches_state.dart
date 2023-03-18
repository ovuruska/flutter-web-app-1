import 'package:equatable/equatable.dart';

import '../../../../../models/Branch.dart';


class SearchBranchesState extends Equatable {
  const SearchBranchesState();

  @override
  List<Object> get props => [];
}

class Start extends SearchBranchesState {}

class Loading extends SearchBranchesState {}

class Loaded extends SearchBranchesState {
  final List<Branch> branches;

  const Loaded({required this.branches});

  @override
  List<Object> get props => branches.map((branch) => branch.toJson()).toList();
}

class Failed extends SearchBranchesState {
  final String message;

  const Failed({required this.message});

  @override
  List<Object> get props => [message];
}

class Empty extends SearchBranchesState {}
