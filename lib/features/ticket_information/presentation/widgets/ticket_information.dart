import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import 'header.dart';
import 'left_side/view.dart';
import 'right_side/view.dart';

class TicketInformation extends StatefulWidget {

  TicketInformation({Key? key}) : super(key: key);

  @override
  _TicketInformationState createState() =>
      _TicketInformationState();
}

class _TicketInformationState
    extends State<TicketInformation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  TicketInformationHeader(),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 48,
                      child: Flex(direction: Axis.horizontal, children: [
                        Expanded(
                            child: TicketInformationLeftSideView(
                              tabController: _tabController,
                            )),
                        Container(
                            width: 360,
                            height: MediaQuery.of(context).size.height - 48,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TicketInformationRightSideView()),
                      ]))
                ]))));
  }
}