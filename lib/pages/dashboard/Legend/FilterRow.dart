import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/Legend/FilterCheckbox.dart';

import '../../../models/Appointment.dart';

class DashboardLegendFilterRow extends StatelessWidget {

  var filters = [
    {
      "label": "Completed",
      "value": dashboardBloc.value.showCompleted,
      "onChanged": (value) {
        dashboardBloc.setShowCompleted(value);
      }
    },
    {
      "label": "Pending",
      "value": dashboardBloc.value.showPending,
      "onChanged": (value) {
        dashboardBloc.setShowPending(value);
      }
    },
    {
      "label": "Confirmed",
      "value": dashboardBloc.value.showConfirmed,
      "onChanged": (value) {
        dashboardBloc.setShowConfirmed(value);
      }
    },
    {
      "label": "In Session",
      "value": dashboardBloc.value.showInSession,
      "onChanged": (value) {
        dashboardBloc.setShowCancelled(value);
      }
    },
    {
      "label":"No Show Unpaid",
      "value": dashboardBloc.value.showNoShowUnpaid,
      "onChanged": (value) {
        dashboardBloc.setShowNoShowUnpaid(value);
      }
    },
    {
      "label":"Pickup Ready",
      "value": dashboardBloc.value.showPickUpReady,
      "onChanged": (value) {
        dashboardBloc.setShowPickUpReady(value);
      }
    },
    {
      "label":"No Show",
      "value": dashboardBloc.value.showNoShow,
      "onChanged": (value) {
        dashboardBloc.setShowNoShow(value);
      }
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: filters
          .map((filter) => DashboardLegendFilterCheckbox(
                label: filter["label"] as String,
                value: filter["value"] as bool,
                onChanged: filter["onChanged"] as Function(bool),
              ))
          .toList(),
    ));
  }
}
