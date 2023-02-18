import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/calendar/controller.dart';

import '../controller.dart';
import '../sidebar/controller.dart';
import 'Controller.dart';

class DashboardEmployeeSelectDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: employeesBloc.stream,
      listener: (value) {},
      builder: (context, snaphot) => StreamListenableBuilder(
          stream: sidebarBloc.stream,
          listener: (value) {
            var items = employeesBloc.value.employees
                    .where((element) {
                      if (element.branch.id ==
                          sidebarBloc.value.currentBranch.id) {}
                      return false;
                    })
                    .map((employee) => employee.name)
                    .toList() +
                [
                  "All Employees",
                  "We Wash",
                  "Full Grooming",
                ];
            var selectedValue = dashboardLegendBloc.value.dropdownValue;
            if (!items.contains(selectedValue)) {
              dashboardLegendBloc.setDropdownValue("All Employees");
            }
          },
          builder: (context, snapshot) => StreamListenableBuilder(
              stream: dashboardLegendBloc.stream,
              listener: (value) {},
              builder: (context, snapshot) => StreamListenableBuilder(
                  stream: sidebarCalendarBloc.stream,
                  listener: (value) {},
                  builder: (context, snapshot) => _build(context)))));

  Widget _build(BuildContext context) {
    var currentBranch = sidebarBloc.value.currentBranch.id;
    var currentDate = sidebarCalendarBloc.value.selectedDate;

    List<Employee> branchEmployees =
        employeesBloc.value.employees.where((element) {
      if (element.branch.id == currentBranch) {
        return true;
      }
      return false;
    }).toList();

    var items = [
          "All Employees",
          "We Wash",
          "Full Grooming",
        ] +
        branchEmployees.map((employee) => employee.name).toList();

    List<DropdownMenuItem<String>> dropdownItems = [];
    for (var item in items) {
      dropdownItems.add(DropdownMenuItem(
        child: Text(
          item,
          style: FlutterFlowTheme.of(context)
              .bodyText2
              .merge(TextStyle(fontSize: 12)),
        ),
        value: item,
      ));
      if (item == "Full Grooming") {
        dropdownItems.add(DropdownMenuItem<String>(
          enabled: false,
          child: Divider(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ));
      }
    }

    var selectedValue = dashboardLegendBloc.value.dropdownValue;

    return Container(
      width: 160,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: dropdownItems,
          value: selectedValue,
          onChanged: (value) {
            dashboardLegendBloc.setDropdownValue(value ?? "All Employees");
            var candidates =
                branchEmployees.where((e) => e.name == (value ?? "")).toList();
            if (candidates.length > 0) {
              var employee = candidates[0];
              dashboardLegendBloc.setEmployee(employee);
              var startOfWeek = currentDate.subtract(
                  Duration(days: currentDate.weekday - DateTime.monday));
              dashboardBloc.fetchWeeklyAppointments(employee, startOfWeek);
            } else {
              dashboardLegendBloc.clearEmployee();
              var currentBranch = sidebarBloc.value.currentBranch;
              dashboardBloc.fetchDailyAppointments(currentBranch, currentDate);
            }
          },
          buttonHeight: 48,
          buttonWidth: 192,
          itemHeight: 48,
        ),
      ),
    );
  }
}
