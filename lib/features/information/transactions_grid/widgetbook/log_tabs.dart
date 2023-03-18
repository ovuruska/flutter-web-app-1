import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

import '../domain/entity/customer_entity.dart';
import '../domain/entity/employee_entity.dart';
import '../domain/entity/log_entity.dart';
import '../presentation/widgets/log_card.dart';
import '../presentation/widgets/log_list.dart';
import '../presentation/widgets/log_tabs.dart';

@WidgetbookUseCase(name: 'Log List', type: LogList)
Widget logTabsUseCase(BuildContext context) {
  // Generate lorem ipsum text
  var description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl nec ultricies lacinia, nisl nisl aliquet nisl, eget aliquam nisl';
  var log = LogEntity(
      id: 1,
      action: 'action',
      createdAt: DateTime.now(),
      target: CustomerEntity(id: 1, name: 'name'),
      description: description);
  var log2 = LogEntity(
      id: 2,
      action: 'action',
      createdAt: DateTime.now(),
      target: EmployeeEntity(id: 2, name: 'name'),
      description: description);

  // Generate 10 log entities
  var logs = List.generate(10, (index) => log) + List.generate(10, (index) => log2);


  return LogTabs(logs: logs);
}
