import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/rebook_context_provider.dart';

import '../widgets/form_column.dart';
import '../widgets/rebook_context.dart';

class RebookAppointment2View extends StatelessWidget {
  const RebookAppointment2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: RebookAppointment2FormColumn()));
  }
}
