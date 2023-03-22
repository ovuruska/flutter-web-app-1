

import 'package:flutter/material.dart';

import '../../../../../common/quicker/inputs/multi_select_chip_field.dart';
import '../../../../../core/domain/entities/branch_entity.dart';

class MultiBranchSelect extends StatelessWidget{
  final List<BranchEntity> options;
  final List<BranchEntity>? initialValue;
  final Function(List<BranchEntity>)? onSelected;

  const MultiBranchSelect({Key? key, required this.options, this.initialValue, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuickerMultiSelectChip<BranchEntity>(
      options: options,
      headerText: 'Branches',
      onSelected: onSelected,
    );
  }

}