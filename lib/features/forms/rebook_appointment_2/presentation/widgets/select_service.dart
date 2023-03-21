import 'package:flutter/material.dart';

import '../../../../../common/quicker/inputs/dropdown_button.dart';

class SelectService extends StatelessWidget {
  final Function(String?)? onChanged;

  SelectService({Key? key, this.onChanged})
      : super(key: key);

  final List<String> options = ['Full Grooming', 'We Wash'];

  @override
  Widget build(BuildContext context) {
    return QuickerDropdownButton<String>(
      labelText: 'Service',
      hintText: 'Service',
      items: options,
      onChanged: onChanged,
    );
  }
}
