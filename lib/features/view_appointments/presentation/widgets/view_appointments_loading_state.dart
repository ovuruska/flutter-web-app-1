import 'package:flutter/material.dart';

import '../../../appointment_schedule/domain/entities/dashboard_appointment_entity.dart';
import 'tab_bar.dart';

class ViewAppointmentsLoadingState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(height: 32),
            Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
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
                  child:Center(
                    child: CircularProgressIndicator(),
                  )
                )),
          ],
        ),
      ),
    );
  }
}
