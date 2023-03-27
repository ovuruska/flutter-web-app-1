import 'package:flutter/material.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import 'list_cancelled.dart';
import 'list_pending.dart';
import 'list_waitlist.dart';
import 'tab_bar.dart';

class ViewAppointments extends StatefulWidget {
  final List<SchedulingAppointmentEntity> pendingAppointments;
  final List<SchedulingAppointmentEntity> waitlistAppointments;
  final List<SchedulingAppointmentEntity> cancelledAppointments;

  const ViewAppointments(
      {Key? key,
      this.pendingAppointments = const [],
      this.waitlistAppointments = const [],
      this.cancelledAppointments = const []})
      : super(key: key);

  @override
  _ViewAppointmentsState createState() => _ViewAppointmentsState();
}

class _ViewAppointmentsState extends State<ViewAppointments>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3,);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(height: 32),
            ViewAppointmentsTabBar(controller: _tabController),
            Container(height: 16),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: const Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF90D7FF).withOpacity(.23),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  AppointmentListPending(
                      appointments: widget.pendingAppointments),
                  AppointmentListWaitlist(
                    appointments: widget.waitlistAppointments,
                  ),
                  AppointmentListCancelled(
                    appointments: widget.cancelledAppointments,
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
