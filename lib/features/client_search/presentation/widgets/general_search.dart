

import 'package:flutter/material.dart';

class GeneralSearch extends StatefulWidget {

  final String? initialValue;
  final Function(String)? onChanged;

  const GeneralSearch({Key? key, this.initialValue,  this.onChanged}) : super(key: key);


  @override
  _GeneralSearchState createState() => _GeneralSearchState();

}

class _GeneralSearchState extends State<GeneralSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 48,
      width: 320,
      child: TextFormField(
        onChanged: widget.onChanged,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          hintText: "General Search",
          hintStyle: TextStyle(
            color: const Color(0xFF9AA6AC),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF5B6871),
            size: 24,
          ),
        ),
      ),
    );
  }
}