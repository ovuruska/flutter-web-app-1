import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/appointments/DataTable/Controller.dart';

class AppointmentsSearchSubmitButton extends StatefulWidget {
  @override
  _AppointmentsSearchSubmitButtonState createState() =>
      _AppointmentsSearchSubmitButtonState();
}

class _AppointmentsSearchSubmitButtonState
    extends State<AppointmentsSearchSubmitButton> {
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: (isLoading)
          ? CircularProgressIndicator()
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                shadowColor: FlutterFlowTheme.of(context).primaryColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                minimumSize: Size(160, 48),
              ),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                appointmentsDataTableBloc.filterData();
                setState(() {
                  isLoading = false;
                });
              },
              child: Text('Submit'),
            ),
    );
  }
}
