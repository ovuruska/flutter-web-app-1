import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';
import 'package:scrubbers_employee_application/widgets/savable_text_field.dart';
import 'package:scrubbers_employee_application/widgets/white_container.dart';


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
    var appointment = AppointmentContextProvider.of(context).appointment;

    var customerNotes = appointment.pet.customerNotes ?? "";
    var employeeNotes = appointment.pet.specialHandlingNotes ?? "";
    var petId = appointment.pet.id;
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
                                // TODO: Set employee notes
                              })),
                      (customerNotes.isNotEmpty)
                          ? WhiteContainer(
                        padding: EdgeInsets.all(8),
                        child: Text(customerNotes,style: TextStyle(fontSize: 16),),
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
