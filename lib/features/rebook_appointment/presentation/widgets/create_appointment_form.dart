import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';

import '../../domain/all_breeds.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/entities/employee_entity.dart';
import 'appointment_section.dart';
import 'branch_section.dart';

class CreateAppointmentForm extends StatefulWidget {
  final List<BranchEntity> branches;
  final List<EmployeeEntity> employees;

  final int customerId;
  final int petId;
  final Function(BranchEntity?)? onBranchSelected;
  final Function(EmployeeEntity?)? onEmployeeSelected;
  final Function(AppointmentEntity appointment)? onSubmit;

  const CreateAppointmentForm(
      {Key? key,
      required this.branches,
      required this.employees,
        required this.customerId,
        required this.petId,
      this.onBranchSelected,
      this.onEmployeeSelected,
      this.onSubmit})
      : super(key: key);

  @override
  _CreateAppointmentFormState createState() => _CreateAppointmentFormState();
}

class _CreateAppointmentFormState extends State<CreateAppointmentForm> {

  DateTime date = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  int duration = 60;
  String service = "We Wash";

  late int branchId;
  late int employeeId = -1;

  @override
  void initState() {
    branchId = (widget.branches.isEmpty) ? -1 : widget.branches[0].id;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Default class pending.
    return Form(
        child: CardSettings(children: <CardSettingsSection>[
      appointmentSection(
        onDateChanged: (date) {
          setState(() {
            this.date = date ?? DateTime.now();
          });
        },
        onTimeChanged: (time) {
          setState(() {
            this.timeOfDay = time ?? TimeOfDay.now();
          });
        },
        onDurationChanged: (duration) {
          setState(() {
            this.duration = duration ?? 60;
          });
        },
        onServiceChanged: (service) {
          setState(() {
            this.service = service ?? "We Wash";
          });
        },
      ),
      branchSection(
          branches: widget.branches,
          onBranchSelected: (branch) {
            if (branch != null) {
              setState(() {
                branchId = branch.id;
              });
              if (widget.onBranchSelected != null) {
                widget.onBranchSelected!(branch);
              }
            }
          },
          employees: widget.employees,
          onEmployeeSelected: (employee) {
            if (employee != null) {
              if (widget.onEmployeeSelected != null) {
                widget.onEmployeeSelected!(employee);
              }
              setState(() {
                employeeId = employee.id;
              });
            }
          }),
      CardSettingsSection(children: [
        CardSettingsHeader(
            child: ElevatedButton(
          onPressed: () {
            if (widget.onSubmit != null) {
              var startOfDay = date.startOfDay;
              var start = startOfDay.add(Duration(
                  hours: timeOfDay.hour,
                  minutes: timeOfDay.minute
                  ));

              var end = start.add(Duration(minutes: duration));
              if (widget.onSubmit != null) {
                widget.onSubmit!(AppointmentEntity(
                    petId: widget.petId,
                    customerId: widget.customerId,
                    id: -1,
                    start: start,
                    end: end,
                    branchId: branchId,
                    employeeId: employeeId));
              }
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            backgroundColor: Colors.green,
          ),
          child: Text("Submit"),
        ))
      ])
    ]));
  }
}
