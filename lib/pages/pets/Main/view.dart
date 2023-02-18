

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import 'DataTable/View.dart';
import 'InformationRow/view.dart';

class PetsMainView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .75,
        height: MediaQuery.of(context).size.height - 48,
        child: Column(

          children: [
            PetsMainInformationRowView(),
            Divider(
              height: 16,
              thickness: 2,
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            PetsMainDataTableView()
          ],
        )
    );
  }



}