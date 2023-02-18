import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/Legend/View.dart';
import 'package:scrubbers_employee_application/pages/dashboard/schedules.dart';
import 'package:scrubbers_employee_application/widgets/header.dart';

import 'DailySchedule/Bloc.dart';
import 'sidebar/controller.dart';
import 'sidebar/view.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: dashboardBloc.stream,
      listener: (value) {
        var updated = dashboardBloc.value.scrollUpdated;
        if (updated) {
          var scrollY = dashboardDailyScheduleBloc.value.scrollY;
          if (scrollY != _scrollController.offset) {
            _scrollController.jumpTo(scrollY);
            dashboardBloc.clearScrollUpdated();
          }
        }
      },
      builder: (context, snapshot) => StreamListenableBuilder(
          stream: sidebarBloc.stream,
          listener: (value) {},
          builder: (context, snapshot) => _build(context)));

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.addListener(_onScrollEvent);
      }
    });

    super.initState();
  }

  void _onScrollEvent() {
    dashboardDailyScheduleBloc.setScrollY(_scrollController.position.pixels);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollEvent);
    _scrollController.dispose();
    super.dispose();
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: LoaderOverlay(
          child:SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Header(),
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DashboardSidebar(),
                        Expanded(
                            child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                DashboardLegendView(),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                    child: DashboardSchedules())
                              ]),
                        ))
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ))
    );
  }
}
