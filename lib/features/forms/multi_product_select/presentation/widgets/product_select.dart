

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/quicker/inputs/multi_select_chip_field.dart';
import 'package:scrubbers_employee_application/common/quicker/inputs/multi_select_dialog.dart';

import '../../../../../core/domain/entities/product_entity.dart';

class MultiProductSelect extends StatelessWidget{
  final Function(List<ProductEntity>)? onSelected;
  final List<ProductEntity> options;
  final List<ProductEntity>? initialValue;

  const MultiProductSelect({Key? key, required this.options, this.initialValue, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuickerMultiSelectDialog<ProductEntity>(
      initialValue: initialValue,
      options: options,
      hintText: "Click to add products",
      allowAllSelected: false,
      headerText: 'Products',
      onSelected: onSelected,
    );
  }

}