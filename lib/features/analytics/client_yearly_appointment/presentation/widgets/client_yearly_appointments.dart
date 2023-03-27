

import 'package:flutter/material.dart';

import '../../domain/entities/monthly_appointment_costs.dart';
import 'stacked_column_chart.dart';

class ClientYearlyAppointments extends StatelessWidget {

  final Map<String, MonthlyAppointmentCosts> data;

  const ClientYearlyAppointments({Key? key, required this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Container(
       child: StackedColumnChart(data: data),
    )));
  }

}