

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_drop_down.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';


class BranchSelect extends StatelessWidget {

  final List<Branch>? options;
  final int? value;
  final Function(int?) onChanged;
  final Function()? iconOnClick;
  final bool disabled;

  const BranchSelect({Key? key, this.options, required this.value, required this.onChanged, this.iconOnClick,this.disabled = false}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<int?>(
      value: value,
      disabled: disabled,
      hintText: "Branch",
      options: (options ?? branchesBloc.value.branches).map((e) => e.id).toList(),
      optionLabels: (options ?? branchesBloc.value.branches).map((e) => e.name).toList(),
      onChanged: onChanged,
      textStyle: FlutterFlowTheme.of(context).bodyText1,
      elevation: 3,
      borderWidth: 2,
      borderRadius: 0,
      borderColor: FlutterFlowTheme.of(context).secondaryColor,
      margin: EdgeInsets.all(0),
    );

  }

}