import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_widgets.dart';
import 'package:scrubbers_employee_application/pages/print/Controller.dart';

import '../DailySchedule/Bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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
                          printViewBloc.setDocument(document);
                          printViewBloc.setContent(value);
                          context.pushNamed("Print");
                        }).catchError(() {
                          setState(() {
                            loading = false;
                          });
                        });
                      });
                    }
                  },
                  text: 'Print',
                  options: FFButtonOptions(
                    width: 72,
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
