import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickerTextField extends StatefulWidget {
  final String? labelText;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final bool? enabled;

  const QuickerTextField({
    Key? key,
    this.labelText = "",
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.enabled = true,
  }) : super(key: key);

  @override
  _QuickerTextFieldState createState() => _QuickerTextFieldState();
}

class _QuickerTextFieldState extends State<QuickerTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 8),
            child:Text(
            widget.labelText ?? "Quicker",
            style: GoogleFonts.poppins(
              color: const Color(0xFF6E7C87),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        )),
        Expanded(
          flex: 6,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              border: InputBorder.none,
            ),
            style: GoogleFonts.inter(
              fontSize: 12,
              color:const Color(0xff252C32),
              fontWeight: FontWeight.normal,
            ),
            controller: _controller,
            onChanged: widget.onChanged,
            onFieldSubmitted:widget.onSaved,
            enabled: widget.enabled,
          ),
        ),
      ],
    );
  }
}
