import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:scrubbers_employee_application/common/quicker/inputs/multi_select_dialog.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

import '../../../../../common/quicker/inputs/multi_select_chip_field.dart';

class MultiGroomerSelect extends StatelessWidget {
  final List<EmployeeEntity> options;
  final List<EmployeeEntity>? initialValue;
  final Function(List<EmployeeEntity>)? onSelected;

  const MultiGroomerSelect({Key? key, required this.options, this.initialValue, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuickerMultiSelectDialog<EmployeeEntity>(
      options: options,
      headerText: "Groomers",
      hintText: "Click to add groomers",
      initialValue: initialValue,
      onSelected: onSelected,
    );
  }



  }

