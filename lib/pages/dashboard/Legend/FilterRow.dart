import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/Legend/FilterCheckbox.dart';

class DashboardLegendFilterRow extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        DashboardLegendFilterCheckbox(
            label: "Completed", value: dashboardBloc.value.showCompleted, onChanged: (value) {
              dashboardBloc.setShowCompleted(value);
        }),
        DashboardLegendFilterCheckbox(
            label: "Cancelled", value: dashboardBloc.value.showCancelled, onChanged: (value) {
          dashboardBloc.setShowCancelled(value);
        }),
        DashboardLegendFilterCheckbox(
            label: "Pending", value: dashboardBloc.value.showPending, onChanged: (value) {
          dashboardBloc.setShowPending(value);
        }),
        DashboardLegendFilterCheckbox(
            label: "Confirmed", value: dashboardBloc.value.showConfirmed, onChanged: (value) {
          dashboardBloc.setShowConfirmed(value);
        }),
      ],
    ));
  }
}
