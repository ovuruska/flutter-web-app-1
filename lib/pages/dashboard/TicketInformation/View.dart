import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Header.dart';

import 'LeftSide/View.dart';
import 'RightSide/View.dart';

class DashboardTicketInformationView extends StatefulWidget {
  DashboardTicketInformationView({Key? key}) : super(key: key);

  @override
  _DashboardTicketInformationViewState createState() =>
      _DashboardTicketInformationViewState();
}

class _DashboardTicketInformationViewState
    extends State<DashboardTicketInformationView>
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
                  DashboardTicketInformationHeader(),
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
