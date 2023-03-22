import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/branch_entity.dart';

class MultiBranchSelectState extends Equatable {
  final List<BranchEntity> options;

  MultiBranchSelectState({
    required this.options,
  });

  @override
  List<Object?> get props => [options];
}
