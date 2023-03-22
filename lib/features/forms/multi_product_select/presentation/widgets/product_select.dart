

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/quicker/inputs/multi_select_chip_field.dart';

import '../../../../../core/domain/entities/product_entity.dart';

class MultiProductSelect extends StatelessWidget{
  final List<ProductEntity> options;
  final List<ProductEntity>? initialValue;

  const MultiProductSelect({Key? key, required this.options, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuickerMultiSelectChip<ProductEntity>(
      options: options,
      allowAllSelected: false,
      headerText: 'Products',
    );
  }

}