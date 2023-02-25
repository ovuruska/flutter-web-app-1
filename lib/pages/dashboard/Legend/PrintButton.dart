import 'dart:convert' show base64Encode;

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_widgets.dart';
import 'package:scrubbers_employee_application/pages/print/Controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../DailySchedule/Bloc.dart';
import 'package:pdf/widgets.dart' as pw;

class DashboardLegendPrintButton extends StatefulWidget {
  @override
  _DashboardLegendPrintButtonState createState() =>
      _DashboardLegendPrintButtonState();
}

class _DashboardLegendPrintButtonState
    extends State<DashboardLegendPrintButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var buttonColor = FlutterFlowTheme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FFButtonWidget(
                  onPressed: () async {
                    if (dashboardDailyScheduleBloc.value.screenshotController ==
                        null) {
                      showSnackbar(context, "Calendar is not available.");
                    } else {
                      setState(() {
                        loading = true;
                      });
                      dashboardDailyScheduleBloc.value.screenshotController!
                          .capture()
                          .then((imageList) async {
                        final document = pw.Document();

                        final image = pw.MemoryImage(imageList!);
                        document.addPage(pw.Page(build: (pw.Context context) {
                          return pw.Center(
                            child: pw.Image(image),
                          ); // Center
                        }));
                        document.save().then((value) {
                          setState(() {
                            loading = false;
                          });
                          launchUrl(Uri.parse("data:application/octet-stream;base64,${base64Encode(value)}"),);

                          printViewBloc.setDocument(document);
                          printViewBloc.setContent(value);

                        }).catchError(() {
                          setState(() {
                            loading = false;
                          });
                        });
                      });
                    }
                  },
                  text: 'Download',
                  options: FFButtonOptions(
                    width: 96,
                    height: 24,
                    color: buttonColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
        ],
      ),
    );
  }
}
