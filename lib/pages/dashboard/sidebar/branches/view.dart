import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import '../controller.dart';
import 'select.dart';

class BranchesView extends StatefulWidget {
  @override
  _BranchesViewState createState() => _BranchesViewState();
}

class _BranchesViewState extends State<BranchesView> {
  var _controller = ExpandableController(initialExpanded: false);
  var expanded = false;

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: branchesBloc.subject.stream,
      listener: (value) {
      },
      builder: (context, snapshot) => StreamListenableBuilder(
          stream: sidebarBloc.subject.stream,
          listener: (item) {
            var branches = branchesBloc.value.branches;
            var currentBranch = sidebarBloc.value.currentBranch;
            if (branches.length > 0 && currentBranch.id == -1) {
              sidebarBloc.setBranch(branches[0]);
            }

          },
          builder: (context, snapshot) => _build(context)));

  Widget _build(BuildContext context) {
    var options = branchesBloc.value.branches;
    var currentBranch = sidebarBloc.value.currentBranch;

    return SelectBranchExpandable(
      options: options,
      value: currentBranch,
    );
  }
}
