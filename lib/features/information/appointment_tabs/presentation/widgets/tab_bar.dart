import 'package:flutter/material.dart';

class ViewAppointmentsTabBar extends StatelessWidget {
  final TabController? controller;

  const ViewAppointmentsTabBar({Key? key, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
        ),
        width: double.infinity,
        child: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: "Pending",
            ),
            Tab(
              text: "Waitlist",
            ),
            Tab(
              text: "Cancelled",
            ),
          ],
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF348AF7),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
        ));
  }
}
