import 'package:flutter/material.dart';

import '../widgets/form_column.dart';

class RebookAppointment2View extends StatelessWidget {
  const RebookAppointment2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3F7).withOpacity(.5),
        borderRadius: BorderRadius.circular(16),
      ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: RebookAppointment2FormColumn()));
  }
}
