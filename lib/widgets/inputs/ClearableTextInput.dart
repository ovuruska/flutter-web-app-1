import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class ClearableTextInput extends StatefulWidget {
  final Function(String?) onChanged;
  final String label;
  final String? initialValue;
  final double? boxWidth;
  final int maxLines;
  final String hintText;

  ClearableTextInput({
    Key? key,
    required this.onChanged,
    this.label = "",
    this.maxLines = 1,
    this.initialValue,
    this.boxWidth = 192,
    this.hintText = "Enter a value...",
  }) : super(key: key);

  @override
  _ClearableTextInputState createState() => _ClearableTextInputState();
}

class _ClearableTextInputState extends State<ClearableTextInput> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.text = widget.initialValue ?? "";
      widget.onChanged(controller.text);
    });
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (widget.label == "")
            ? Container()
            : Text(widget.label, style: FlutterFlowTheme.of(context).bodyText1),
        SizedBox(
          width: widget.boxWidth,
          child: TextFormField(
            maxLines: widget.maxLines,
            controller: controller,
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
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      onPressed: () => setState(() {
                        controller.clear();
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
      ],
    );
  }
}
