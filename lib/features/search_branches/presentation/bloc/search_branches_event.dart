

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class SearchBranchesEvent extends Equatable {
  const SearchBranchesEvent();

  @override
  List<Object> get props => [];
}

class GetBranchesEvent extends SearchBranchesEvent {

  GetBranchesEvent();

  @override
  List<Object> get props => [];
}