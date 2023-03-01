import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/view_logs/presentation/widgets/card_description.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

@WidgetbookUseCase(name: 'Card Description', type: CardDescription)
Widget cardDescriptionUseCase(BuildContext context) {
  // Generate lorem ipsum text
  var description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl nec ultricies lacinia, nisl nisl aliquet nisl, eget aliquam nisl';
  return CardDescription(description: description);
}
