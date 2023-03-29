import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class ControlledIntegerInput extends StatefulWidget {
  final Function(String?) onChanged;
  final String label;
  final String? initialValue;
  final int boxWidth;
  final int maxLines;
  final String hintText;
  final String value;

  ControlledIntegerInput({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label = "",
    this.maxLines = 1,
    this.initialValue,
    this.boxWidth = 192,
    this.hintText = "Enter a value...",
  }) : super(key: key);

  @override
  _ControlledIntegerInputState createState() =>
      _ControlledIntegerInputState();
}

class _ControlledIntegerInputState
    extends State<ControlledIntegerInput> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ControlledIntegerInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget != this.widget) {
      if (this._controller.text != this.widget.value) {
        this._controller.value =
            _controller.value.copyWith(text: this.widget.value);
      }
    }
  }

  @override
  void initState() {
    setState(() {
      _controller.text = widget.initialValue ?? "";
      widget.onChanged(_controller.text);
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.label, style: FlutterFlowTheme.of(context).bodyText1),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 16, 16),
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  style: FlutterFlowTheme.of(context).bodyText1,
                  textAlign: TextAlign.start,
                ),
              ),
            )
          ],
        ));
  }
}
