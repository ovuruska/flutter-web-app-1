import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

import '../../../../../common/quicker/inputs/multi_select_chip_field.dart';

class GroomerSelect extends StatelessWidget {
  final List<EmployeeEntity> options;
  final List<EmployeeEntity>? initialValue;

  const GroomerSelect({Key? key, required this.options, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuickerMultiSelectChip<EmployeeEntity>(
      options: options,
      headerText: "Groomers",
      initialValue: initialValue,
    );
  }



  }

