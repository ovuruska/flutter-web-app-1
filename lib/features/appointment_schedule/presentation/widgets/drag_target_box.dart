

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_appointment_entity.dart';

import '../../utils/border.dart';
import '../../utils/constants.dart';
import '../../utils/onAcceptWithDetails.dart';

class DragTargetBox extends StatelessWidget{
  final int start;
  final int employeeId;

  const DragTargetBox({Key? key, required this.start, required this.employeeId}) : super(key: key);

  Widget _build(BuildContext context) =>  SizedBox(
      width: boxWidth,
      height: boxHeight,

      child:Container(
    decoration:BoxDecoration(
      border:border(),
    ),
    padding: EdgeInsets.all(8),
      ));

  @override
  Widget build(BuildContext context) {
    return DragTarget<DashboardAppointmentEntity>(
      onAcceptWithDetails: onAcceptWithDetails(start),
      builder: (context, candidateData, rejectedData) => _build(context),

    );
  }



}