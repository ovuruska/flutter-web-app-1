import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../models/Branch.dart';
import '../../domain/entities/branch_entity.dart';

@immutable
class ModifyBranchBaseEvent extends Equatable {
  const ModifyBranchBaseEvent();

  @override
  List<Object> get props => [];
}

class ClearBranchEvent extends ModifyBranchBaseEvent {
  const ClearBranchEvent();

  @override
  List<Object> get props => [];
}

class ModifyBranchEvent extends ModifyBranchBaseEvent {
  final BranchEntity branch;
  const ModifyBranchEvent({required this.branch});

  @override
  List<Object> get props => [];
}


class SetBranchEvent extends ModifyBranchBaseEvent {
  final Branch branch;
  const SetBranchEvent({required this.branch});

  @override
  List<Object> get props => [branch];
}
