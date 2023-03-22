import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/branch_entity.dart';

class BranchSelectState extends Equatable {
  final List<BranchEntity> options;

  BranchSelectState({
    required this.options,
  });

  @override
  List<Object?> get props => [options];
}
