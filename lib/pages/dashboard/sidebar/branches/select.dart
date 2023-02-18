import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/pages/dashboard/repository.dart';
import '../../controller.dart';
import '../calendar/controller.dart';
import '../controller.dart';
import 'item.dart';

class SelectBranchExpandable extends StatefulWidget {
  final List<Branch> options;
  final Branch value;

  const SelectBranchExpandable({Key? key, required this.options, required this.value}) : super(key: key);
  @override
  _SelectBranchExpandableState createState() => _SelectBranchExpandableState();
}

class _SelectBranchExpandableState extends State<SelectBranchExpandable> {
  var _controller = ExpandableController(initialExpanded: false);
  var expanded = false;

  void onTap(Branch? branch) {
    if (branch == null) return;
    sidebarBloc.setBranch(branch);
    DashboardRepository.instance
        .getDailyAppointments(
        branch, sidebarCalendarBloc.value.selectedDate)
        .then((value) {
      if (value != null) dashboardBloc.setAppointments(value);
    });
  }


  Widget build(BuildContext context){

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.only(left:8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: FlutterFlowTheme.of(context).primaryBackground ,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => setState(() {
                    expanded = !expanded;
                    _controller.toggle();
                  }),
                  icon: Icon(
                    (expanded) ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: FlutterFlowTheme.of(context).primaryColor,
                  )),
              Text(
                'Branches',
                style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          ExpandablePanel(
            controller: _controller,
            collapsed: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                child: Container(
                    width: 360, child: BranchItem(branch: widget.value))),
            expanded: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: widget.options
                    .map<Widget>((branch) => Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: BranchItem(branch: branch, onTap: onTap,selected: (branch.id == widget.value.id))))
                    .toList()),
          )
        ],
      ),
    );
  }
}
