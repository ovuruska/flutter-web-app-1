import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_drop_down.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

class ControlledDropdownButton<T> extends StatelessWidget {
  T? value;
  String? hintText;
  List<T> options;
  Function()? iconOnClick;
  Function(T?)? onChanged;
  double width;


  ControlledDropdownButton(
      {required this.value,
      this.hintText,
      required this.options,
      this.iconOnClick,
        this.width=192,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: width.toDouble(),
          child: FlutterFlowDropDown<T?>(
            value: value,
            hintText: hintText,
            options: options,
            onChanged: (value) {
              if (onChanged != null) onChanged!(value);
            },
            textStyle: FlutterFlowTheme.of(context).bodyText1,
            elevation: 3,
            borderWidth: 2,
            borderRadius: 0,
            borderColor: FlutterFlowTheme.of(context).secondaryColor,
            margin: EdgeInsets.all(0),
          ),
        ),
      ),
      (value == null)
          ? Container(
        width:40
      )
          : IconButton(
              onPressed: () {
                if (iconOnClick != null) iconOnClick!();
              },
              icon: Icon(
                Icons.clear,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 24,
              ),
              iconSize: 24,
            )
    ]));
  }
}
