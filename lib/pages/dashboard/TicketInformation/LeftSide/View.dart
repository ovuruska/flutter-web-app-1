import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';

import '../Current/View.dart';
import 'Checkin/View.dart';
import 'Past/View.dart';
import 'Upcoming/View.dart';


class TicketInformationLeftSideView extends StatelessWidget {
  final tabController;

  TicketInformationLeftSideView({Key? key, required this.tabController})
      : super(key: key);

  List<Widget> getTabs(BuildContext context) => [
        Tab(
            child: Text(
          "Upcoming appointments",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        )),
        Tab(
          child: Text(
            "Prior appointments",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F5FA),
          borderRadius: BorderRadius.circular(1),
        ),
        child: Column(children: [

          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TicketInformationCurrentAppointmentView(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: TabBar(
              controller: tabController,
              tabs: getTabs(context),
            ),
          ),
          Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .25,
                child: TicketInformationUpcomingView(),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .4,
                  child: TicketInformationPastAppointmentView()),
            ],
          )),
          TicketInformationCheckinView()

        ]));
  }
}
