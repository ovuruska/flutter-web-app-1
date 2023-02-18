

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import 'Create/View.dart';
import 'DataTable/View.dart';

class ServicesMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:Column(

          children: [
            Container(
                constraints: BoxConstraints(
                  minHeight: 320,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [ServicesCreateView()],
                )),
            Flexible(child: ServicesDataTableView())
          ],
        )
    );
  }

}