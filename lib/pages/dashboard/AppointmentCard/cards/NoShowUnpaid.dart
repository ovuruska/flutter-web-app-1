import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';

import 'AppointmentCard.dart';
import 'Wrapper.dart';

class DashboardAppointmentCardNoShowUnpaid extends StatelessWidget {
  final Appointment appointment;

  DashboardAppointmentCardNoShowUnpaid({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    const headerColor = Color(0xFFFF0000);
    var customerRowTailItem = Container(
      decoration:BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(4),
      ),
      padding:EdgeInsets.only(left:8,right:8,top:4,bottom:4),
      child:Text("UNPAID",style:TextStyle(color:Colors.black,fontSize:12,fontWeight:FontWeight.w700),),
    );
    return AppointmentCardWrapper(
        appointment: appointment,
        child: AppointmentCard(
          headerBackgroundColor:headerColor,
          appointment: appointment,
          customerRowTailItem: customerRowTailItem,
          itemWidth: itemWidth,
        ));
  }
}
