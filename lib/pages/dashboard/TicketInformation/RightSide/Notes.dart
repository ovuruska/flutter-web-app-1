import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/shadow.dart';
import 'package:scrubbers_employee_application/pages/dashboard/TicketInformation/Controller.dart';
import 'package:scrubbers_employee_application/widgets/savable_text_field.dart';
import 'package:scrubbers_employee_application/widgets/white_container.dart';

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
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: ticketInformationInputBloc.stream,
      listener: (val) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var appointment = ticketInformationInputBloc.value.appointment!;

    var customerNotes = appointment.dog.customerNotes;
    var employeeNotes = appointment.dog.employeeNotes;
    var petId = appointment.dog.id;
    var controller = TextEditingController(text: employeeNotes);

    return Container(
        child: DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
              physics: NeverScrollableScrollPhysics(),
              tabs: [
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
              WhiteContainer(
                padding: EdgeInsets.all(8),
                  child: SavableTextField(
                  controller: controller,
                  onSaved: (s) {
                    ticketInformationInputBloc.setEmployeeNotes(petId, s);
                  })),
              (customerNotes.isNotEmpty)
                  ? WhiteContainer(
                padding: EdgeInsets.all(8),
                      child: Text(appointment.dog.customerNotes,style: TextStyle(fontSize: 16),),
                    )
                  : WhiteContainer(
                      child: Center(child: Text("No notes")),
                    )
            ],
          ))
        ],
      ),
    ));
  }
}
