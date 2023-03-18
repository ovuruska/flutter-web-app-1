import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../models/Branch.dart';


@immutable
class SearchBranchesEvent extends Equatable {
  const SearchBranchesEvent();

  @override
  List<Object> get props => [];
}

class PatchBranchEvent extends SearchBranchesEvent {
  final Branch branch;

  PatchBranchEvent({required this.branch});

  @override
  List<Object> get props => [branch];
}

class CreateNewBranchEvent extends SearchBranchesEvent {

  CreateNewBranchEvent();

  @override
  List<Object> get props => [];
}
class RemoveBranchEvent extends SearchBranchesEvent {
  final int id;

  RemoveBranchEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetBranchesEvent extends SearchBranchesEvent {

  GetBranchesEvent();

  @override
  List<Object> get props => [];
}

class SetBranchesEvent extends SearchBranchesEvent {
  final List<Branch> branches;

  SetBranchesEvent({required this.branches});

  @override
  List<Object> get props => [branches];
}