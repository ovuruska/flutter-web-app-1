import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class QuickerMultiSelectChip<T > extends StatefulWidget {
  final List<T> options;
  final List<T>? initialValue;
  final String? headerText;
  final bool allowAllSelected;
  final void Function(List<T>)? onSelected;

  const QuickerMultiSelectChip(
      {Key? key,
      this.options = const [],
      this.initialValue,
      this.headerText,
      this.allowAllSelected = true,
      this.onSelected})
      : super(key: key);

  @override
  _QuickerMultiSelectChipState<T> createState() => _QuickerMultiSelectChipState<T>();
}

class _QuickerMultiSelectChipState<T >
    extends State<QuickerMultiSelectChip<T>> {
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

  String _headerText(int lengthOfSelected) {
    if (widget.headerText == null) return "";
    if (lengthOfSelected == 0) {
      if (widget.allowAllSelected) {
        return "${widget.headerText} (All selected)";
      } else {
        return "${widget.headerText} (None selected)";
      }
    } else {
      return "${widget.headerText} ($lengthOfSelected selected)";
    }
  }

  @override
  Widget build(BuildContext context) {
    List<T> filteredOptions = widget.options
        .where((element) => !_selected.contains(element))
        .toList();
    try {
      _selected.sort((a, b) => a.toString().compareTo(b.toString()));
    } catch (e) {}
    List<T> options = _selected + filteredOptions;

    return MultiSelectChipField<T>(
        height: 48,
        headerColor: const Color(0XFF2D7CB6),
        searchIcon: Icon(Icons.search, color: Colors.white),
        closeSearchIcon: Icon(Icons.close, color: Colors.white),
        selectedChipColor: const Color(0XFFF2EFFF),
        chipColor: const Color(0XFFF2F4F7),
        textStyle: GoogleFonts.inter(color: Colors.black),
        searchTextStyle: GoogleFonts.inter(color: Colors.white),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFFDDE2E4), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        searchable: true,
        onTap: (value) {
          setState(() {
            _selected = value;
          });
          if (widget.onSelected != null) widget.onSelected!(_selected);
        },
        title: Text(_headerText(_selected.length),
            style: GoogleFonts.inter(fontSize: 16, color: Colors.white)),
        items:
            options.map((e) => MultiSelectItem<T>(e, e.toString())).toList());
  }
}
