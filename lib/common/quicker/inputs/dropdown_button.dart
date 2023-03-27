
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickerDropdownButton<T> extends StatefulWidget{
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final String? labelText;
  final String? hintText;
  final T? initialValue;

  const QuickerDropdownButton({Key? key, required this.items,  this.onChanged, this.labelText, this.hintText,this.initialValue}) : super(key: key);

  @override
  _QuickerDropdownButtonState<T> createState() => _QuickerDropdownButtonState<T>();
}

class _QuickerDropdownButtonState<T> extends State<QuickerDropdownButton<T>>{

  late T? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  onSelected(T? value){
    setState(() {
      _value = value;
    });
    if(widget.onChanged!=null) widget.onChanged!(value);
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      items: widget.items.map((e) => DropdownMenuItem<T>(
        value: e,
        child: Text(e.toString()),
      )).toList(),
      value: _value,
      onChanged: onSelected,
      decoration: InputDecoration(
      labelText: widget.labelText,
      floatingLabelStyle: GoogleFonts.openSans(
        fontSize: 16,
        color: const Color(0xFF2D7CB6),
      ),
      labelStyle: GoogleFonts.openSans(
        fontSize: 16,
        color: const Color(0xFF9AA6AC),
      ),
      hintStyle: GoogleFonts.openSans(
        fontSize: 16,
        color: const Color(0xFF9AA6AC),
      ),
      hintText: widget.hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: const Color(0xFFDDE2E4)),
        gapPadding: 0,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    );
  }

}