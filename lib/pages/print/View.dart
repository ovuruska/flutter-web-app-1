import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/print/Controller.dart';

class PrintView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: printViewBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var backgroundColor = FlutterFlowTheme.of(context).primaryColor;
    var textColor = FlutterFlowTheme.of(context).primaryText;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: textColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Print", style: TextStyle(color: textColor)),
        ),
        body: PdfPreview(
            initialPageFormat: PdfPageFormat.a4,
            build: (format) => printViewBloc.value.content));
  }
}
