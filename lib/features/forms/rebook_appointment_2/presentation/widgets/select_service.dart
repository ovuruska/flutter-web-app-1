import 'package:flutter/material.dart';

import '../../../../../common/quicker/inputs/dropdown_button.dart';

class SelectService extends StatelessWidget {
  final Function(String?)? onChanged;
  final String? initialValue;

  SelectService({Key? key, this.onChanged, this.initialValue})
      : super(key: key);

  final List<String> options = ['Full Grooming', 'We Wash'];

  @override
  Widget build(BuildContext context) {
    return QuickerDropdownButton<String>(
      labelText: 'Service',
      initialValue: initialValue,
      hintText: 'Service',
      items: options,
      onChanged: onChanged,
    );
  }
}
