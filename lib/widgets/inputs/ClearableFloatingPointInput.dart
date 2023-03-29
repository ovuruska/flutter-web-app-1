import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrubbers_employee_application/common/DecimalTextInputFormatter.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class ClearableFloatingPointInput extends StatefulWidget {
  final Function(String?) onChanged;
  final String label;
  final String? initialValue;
  final int boxWidth;
  final int maxLines;
  final String hintText;

  ClearableFloatingPointInput({
    Key? key,
    required this.onChanged,
    this.label = "",
    this.maxLines = 1,
    this.initialValue,
    this.boxWidth = 192,
    this.hintText = "Enter a value...",
  }) : super(key: key);

  @override
  _ClearableFloatingPointInputState createState() => _ClearableFloatingPointInputState();
}

class _ClearableFloatingPointInputState extends State<ClearableFloatingPointInput> {
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
    focusNode.addListener(() {
      setState(() {});
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9\.]")),
                    DecimalTextInputFormatter(decimalRange: 2),

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
