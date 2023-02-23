import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';

import 'waitlist/list_view.dart';
import 'pending/list_view.dart';
import 'cancelled/list_view.dart';
import 'pending/controller.dart';
import 'cancelled/controller.dart';
import 'waitlist/controller.dart';

class SidebarTabBar extends StatelessWidget {
  final TabController tabController;

  const SidebarTabBar({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: sidebarCancelledAppointmentsBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => StreamListenableBuilder(
          stream: sidebarPendingAppointmentsBloc.stream,
          listener: (value) {},
          builder: (context, snapshot) => StreamListenableBuilder(
              stream: sidebarWaitlistBloc.stream,
              listener: (value) {},
              builder: (context, snapshot) => _build(context))));

  Widget _build(BuildContext context) => TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          SidebarPendingAppointmentList(
            appointments: sidebarPendingAppointmentsBloc.value.appointments,
          ),
          SidebarReschedulingList(
            appointments: sidebarWaitlistBloc.value.appointments,
          ),
          SidebarCancelledAppointmentList(
            appointments: sidebarCancelledAppointmentsBloc.value.appointments,
          )
        ],
      );
}
