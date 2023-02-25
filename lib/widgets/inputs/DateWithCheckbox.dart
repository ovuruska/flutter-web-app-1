import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class DateWithCheckbox extends StatelessWidget {
  final DateTime? date;
  final Function(DateTime?) onChanged;
  final double height;
  final double width;
  final bool disabled;

  DateWithCheckbox({Key? key,this.width=192,this.height = 24, required this.date, required this.onChanged,this.disabled=false})
      : super(key: key);
  DateFormat format = new DateFormat("MMMM dd, yyyy");

  String formatDate(DateTime date) =>
      DateFormat("dd/MM/yyyy hh:mm a").format(date);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: this.date != null,
            onChanged: (disabled) ? null :(value) {
              if (onChanged == null) return;
              if (value == true) {
                onChanged(DateTime.now());
              } else {
                onChanged(null);
              }
            },
          ),
          Container(
            width: width,
            height: height,
            child: Center(
                child: Text(
              this.date == null ? "" : formatDate(this.date!),
              style: FlutterFlowTheme.of(context).bodyText2.merge(TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                  )),
            )),
          ),
        ],
      ),
    );
  }
}
