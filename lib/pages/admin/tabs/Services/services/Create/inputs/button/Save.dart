import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';
import 'package:scrubbers_employee_application/models/Service.dart';

import '../../../DataTable/Controller.dart';
import '../../Controller.dart';

class ServicesSaveButton extends StatefulWidget {
  @override
  _ServicesSaveButtonState createState() =>
      _ServicesSaveButtonState();
}

class _ServicesSaveButtonState
    extends State<ServicesSaveButton> {
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: servicesCreateBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {


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
        onPressed: () async {
          //

          setState(() {
            isLoading = true;
          });
          var duration =
          Duration(minutes:int.parse(servicesCreateBloc.value.duration) );
          var service = ServiceModel(
              id:servicesCreateBloc.value.id,
              name: servicesCreateBloc.value.name,
              cost:double.parse(servicesCreateBloc.value.cost) ,
              description: servicesCreateBloc.value.description,
              duration: duration);


          servicesDataTableBloc.patchService(service).then((value) {
            if (value)
              servicesCreateBloc.reset();
            else
              showSnackbar(context, "Please fill all fields!");
            setState(() {
              isLoading = false;
            });
          });
        },
        child: Text("Save"),
      ),
    );
  }
}
