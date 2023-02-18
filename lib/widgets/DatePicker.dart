import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime?)? onChanged;
  final Function()? onClear;
  final String text;

  DatePicker({this.onChanged, this.text = "Select", this.onClear});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.initState();
    focusNode.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text, style: FlutterFlowTheme.of(context).bodyText1),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 192,
              child: TextField(
                  mouseCursor: SystemMouseCursors.click,
                  showCursor: false,
                  controller: controller,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Click to select date",
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
                              if (widget.onClear != null) widget.onClear!();
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
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        //get today's date
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      setState(() {
                        DateFormat format = new DateFormat("MMMM dd, yyyy");
                        var dateString = format.format(pickedDate);
                        controller.text = dateString;
                        if (widget.onChanged != null)
                          widget.onChanged!(pickedDate);
                      });
                    }
                  }),
            )),
      ],
    ));
  }
}
