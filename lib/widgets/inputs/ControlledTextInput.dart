import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class ControlledTextInput extends StatefulWidget {
  final Function(String?) onChanged;
  final String label;
  final String? initialValue;
  final int boxWidth;
  final int maxLines;
  final String hintText;
  final String value;

  ControlledTextInput({
    Key? key,
    required this.onChanged,
    required this.value,
    this.label = "",
    this.maxLines = 1,
    this.initialValue,
    this.boxWidth = 192,
    this.hintText = "Enter a value...",
  }) : super(key: key);

  @override
  _ControlledTextInputState createState() => _ControlledTextInputState();
}

class _ControlledTextInputState extends State<ControlledTextInput> {
  TextEditingController _controller = TextEditingController();


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _controller.text = widget.initialValue ?? "";
      widget.onChanged(_controller.text);
    });
  }

  @override
  void didUpdateWidget(ControlledTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget != this.widget) {
      if (this._controller.text != this.widget.value) {
        this._controller.value =
            _controller.value.copyWith(text: this.widget.value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (widget.label == "") ? Container() : Text(widget.label, style: FlutterFlowTheme.of(context).bodyText1),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
          child: SizedBox(
            width: widget.boxWidth.toDouble(),
            child: TextFormField(
              maxLines: widget.maxLines,
              controller: _controller,
              onChanged: (value) => setState(() {
                widget.onChanged(value);
              }),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: FlutterFlowTheme.of(context).subtitle2,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                  onPressed: () => setState(() {
                    _controller.clear();
                    widget.onChanged(null);
                  }),
                  icon: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
                )
                    : null,
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
              textAlign: TextAlign.start,
            ),
          ),
        )
      ],
    );
  }
}
