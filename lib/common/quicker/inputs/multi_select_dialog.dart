import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class QuickerMultiSelectDialog<T> extends StatefulWidget {
  final List<T> options;
  final List<T>? initialValue;
  final String? hintText;
  final String? headerText;
  final bool allowAllSelected;
  final void Function(List<T>)? onSelected;

  const QuickerMultiSelectDialog(
      {Key? key,
      this.options = const [],
      this.initialValue,
      this.headerText,
      this.allowAllSelected = true,
      this.onSelected, this.hintText})
      : super(key: key);

  @override
  _QuickerMultiSelectDialogState<T> createState() =>
      _QuickerMultiSelectDialogState<T>();
}

class _QuickerMultiSelectDialogState<T>
    extends State<QuickerMultiSelectDialog<T>> {
  late List<T> _selected;

  @override
  void initState() {
    super.initState();
    if (widget.allowAllSelected) {
      _selected = widget.options;
    } else {
      _selected = widget.initialValue ?? <T>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    var multiSelect =
        widget.options.map((e) => MultiSelectItem(e, e.toString())).toList();
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child:MultiSelectDialogField<T>(
        buttonText: Text(widget.hintText ?? ""),
        title: Text(widget.headerText ?? ""),
        chipDisplay: MultiSelectChipDisplay(
          icon: Icon(Icons.close),
          onTap: (item) {
            setState(() {
              _selected.remove(item);
            });
          },
        ),
        items: multiSelect,
        onConfirm: (values) => setState(() {
              _selected = values;
            })));
  }
}
