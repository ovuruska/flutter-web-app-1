import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';

import 'TextInput.dart';

class TicketInformationRightSideNotes extends StatefulWidget {
  TicketInformationRightSideNotes({Key? key}) : super(key: key);

  @override
  _TicketInformationRightSideNotesState createState() =>
      _TicketInformationRightSideNotesState();
}

class _TicketInformationRightSideNotesState
    extends State<TicketInformationRightSideNotes>
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
    var appointment = ticketInformationInputBloc.value.appointment!;
    return Container(
        child: DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(tabs: [
            Tab(
                child: Text("Special handling notes",
                    style: TextStyle(color: Colors.black))),
            Tab(
                child: Text("Client notes",
                    style: TextStyle(color: Colors.black))),
          ], controller: _tabController),
          Container(height: 16),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              SpecialHandlingNotesTextInput(),
              Text(appointment.dog.customerNotes),
            ],
          ))
        ],
      ),
    ));
  }
}
