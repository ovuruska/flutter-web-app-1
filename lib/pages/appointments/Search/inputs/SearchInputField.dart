import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import '../Controller.dart';

class AppointmentsSearchInputsSearchField extends StatefulWidget {
  @override
  _AppointmentsSearchInputsSearchFieldState createState() =>
      _AppointmentsSearchInputsSearchFieldState();
}

class _AppointmentsSearchInputsSearchFieldState
    extends State<AppointmentsSearchInputsSearchField> {
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
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Customer", style: FlutterFlowTheme.of(context).bodyText1),
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 192,
            child: TextFormField(
              controller: controller,
              onChanged: (value) => setState(() {
                appointmentSearchBloc.setCustomerName(value);
              }),
              decoration: InputDecoration(
                hintText: "Enter a value...",
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
                          appointmentSearchBloc.setCustomerName("");
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
    ));
  }
}
