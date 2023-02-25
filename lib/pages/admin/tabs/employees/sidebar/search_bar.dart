import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/widgets/headless_table%202.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../../../../../blocs/branches/Controller.dart';
import '../../../../../flutter_flow/flutter_flow_drop_down.dart';
import '../../../../../models/Branch.dart';
import '../../../../../widgets/inputs/ControlledDropdownButton.dart';
import '../controller.dart';
import 'select_branch.dart';

class AdminEmployeeTabSearchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(stream: adminEmployeeTabBloc.stream, builder: (context, _) => _build(context));

  Widget _build(BuildContext context){
    var options = branchesBloc.value.branches;

    return Container(

        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: HeadlessDataTable(
          numberOfColumns: 2,
          rows:[
            DataRow(
              cells: [
                DataCell(Text("Employee name")),
                DataCell(ClearableTextInput(
                  boxWidth: 192,
                  hintText: "Employee name",
                  onChanged: (String? value) {
                    if (value != null) {
                      adminEmployeeTabBloc.setEmployeeName(value);
                    } else {
                      adminEmployeeTabBloc.setEmployeeName("");
                    }
                  },
                )),
              ]
            ),
            DataRow(
              cells:[
                DataCell(Text("Branch")),
                DataCell(
                    FlutterFlowDropDown<Branch?>(
                      borderColor: Colors.transparent,
                      textStyle: FlutterFlowTheme.of(context).bodyText1,
                      value: adminEmployeeTabBloc.value.currentBranch,
                      options: options,
                      onChanged: (value) {
                        if (value != null) {
                          adminEmployeeTabBloc.setCurrentBranch(value);
                        }
                      },
                      elevation: 3,
                      borderWidth: 2,
                      borderRadius: 0,
                      margin: EdgeInsets.all(0),
                    )
                )

              ]
            )

          ]
        ));
  }
}
