

import 'package:flutter/cupertino.dart';

import '../../features/analytics/client_cancellation_rate/presentation/pages/cancellation_rate.dart';
import '../../features/analytics/client_no_show_rate/presentation/pages/no_show_rate.dart';
import '../../features/analytics/client_visits/presentation/pages/client_visits.dart';

class AnalyticsColumn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Expanded(
          child:NoShowRateView()
          ),
          Container(height:8),
          Expanded(
          child:CancellationRateView()),
          Container(height:8),
          Expanded(
            child:ClientVisitsView()
          )
        ]
      )
    );
  }

}