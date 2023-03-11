

import 'package:flutter/material.dart';

import '../../../../widgets/cards/root/entity.dart';
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
      onLeave: (data) => print('onLeave'),
      onAcceptWithDetails: onAcceptWithDetails(start, employeeId),
      builder: (context, candidateData, rejectedData) => _build(context),

    );
  }



}