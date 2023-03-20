

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/features/forms/groomer_select/presentation/widgets/chip_text_field.dart';


class GroomerSelect extends StatelessWidget{
  final List<EmployeeEntity> options;
  final List<EmployeeEntity>? initialValue;

  const GroomerSelect({Key? key, this.options = const [],this.initialValue}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChipTextField<EmployeeEntity>();
  }
}

