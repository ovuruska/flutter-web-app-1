import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/create_new_appointment/presentation/widgets/customer_section.dart';

class CreateAppointmentForm extends StatefulWidget {
  @override
  _CreateAppointmentFormState createState() => _CreateAppointmentFormState();
}

class _CreateAppointmentFormState extends State<CreateAppointmentForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController petController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState(){

  }


  @override
  Widget build(BuildContext context) {
    // Default class pending.
    return Form(
        child: CardSettings(children: <CardSettingsSection>[
      customerSection(
          nameController: nameController,
          petController: petController,
          phoneController: phoneController),
    ]));
  }
}
