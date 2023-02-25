import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/quicker_multi_select/chip.dart';

class QuickerChipList<T> extends StatelessWidget {
  final items;
  final Function(T) onPressed;
  const QuickerChipList(
      {Key? key, required this.items, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Wrap(
        children: List<Widget>.generate(
      items.length,
      (int idx) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
            child:QuickerChip(
          label: items[idx].toString(),
          onPressed: () => onPressed(items[idx]),
        ));
      },
    ).toList()));
  }
}
