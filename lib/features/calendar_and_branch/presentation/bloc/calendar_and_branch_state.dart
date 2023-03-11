import 'package:equatable/equatable.dart';

import '../../domain/entities/branch_id_and_name.dart';

class CalendarAndBranchState extends Equatable {
  @override
  List<Object?> get props => [];
}


class Loading extends CalendarAndBranchState {}

class Loaded  extends CalendarAndBranchState {
  final List<BranchIdAndName> branches;
  Loaded({required this.branches});
}
