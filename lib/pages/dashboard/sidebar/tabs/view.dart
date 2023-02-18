import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/tabs/tab_bar.dart';

class SidebarTabsView extends StatefulWidget {
  SidebarTabsView({Key? key}) : super(key: key);

  @override
  _SidebarTabsViewState createState() => _SidebarTabsViewState();
}

class _SidebarTabsViewState extends State<SidebarTabsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> getTabs(BuildContext context) {
    return [
      Tab(
        child: Text(
          'Pending',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Inter',
                fontSize: 14,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
      ),
      Tab(
        child: Text(
          'Waitlist',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Inter',
                fontSize: 14,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
      ),
      Tab(
        child: Text(
          'Cancelled',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Inter',
                fontSize: 14,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                controller: _tabController,
                tabs: getTabs(context),
              ),
              Expanded(
                  child: SidebarTabBar(
                tabController: _tabController,
              )),
            ],
          ),
        ));
  }
}
