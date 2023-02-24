import 'package:flutter/material.dart';

class QuickerDropdownItem<T> extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final T item;

  const QuickerDropdownItem(
      {Key? key,
      required this.value,
      required this.item,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.toString()),
      trailing: Checkbox(
        value: value,
        onChanged: (value) => onChanged(value ?? false),
      ),
    );
  }
}
