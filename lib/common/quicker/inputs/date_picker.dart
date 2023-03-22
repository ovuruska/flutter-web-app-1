import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickerDataPicker extends StatefulWidget {
  final DateTime? date;
  final Function(DateTime)? onChanged;
  const QuickerDataPicker({Key? key, this.date, this.onChanged}) : super(key: key);

  @override
  _QuickerDataPickerState createState() => _QuickerDataPickerState();
}

class _QuickerDataPickerState extends State<QuickerDataPicker> {
  late DateTime _date;
  @override
  void initState() {
    super.initState();
    _date = widget.date ?? DateTime.now();
    if (widget.onChanged != null) widget.onChanged!(_date);

  }

  setDate(DateTime date) {
    setState(() {
      _date = date;
    });
    if (widget.onChanged != null) widget.onChanged!(date);
  }

  String getDateString(DateTime date) =>
      '${date.month}.${date.day}.${date.year}';

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () async {
              final date = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030));
              if (date != null) {
                setDate(date);
              }
            },
            child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    border: Border.all(color: Color(0xFFD8DAE5)),
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.all(8),
                child: Center(
                    child: Text(getDateString(_date),
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF696F8C)))))));
  }
}
