import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Payroll.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';
import 'package:scrubbers_employee_application/pages/payroll/Controller.dart';
import 'package:scrubbers_employee_application/pages/payroll/Filter/Controller.dart';

class PayrollFilterInputSubmitButton extends StatefulWidget {
  @override
  _PayrollFilterInputSubmitButtonState createState() =>
      _PayrollFilterInputSubmitButtonState();
}

class _PayrollFilterInputSubmitButtonState
    extends State<PayrollFilterInputSubmitButton> {
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (isLoading)
          ? CircularProgressIndicator()
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                shadowColor: FlutterFlowTheme.of(context).primaryColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                minimumSize: Size(160, 48),
              ),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                //PayrollRepository.instance.fetchAll(payrollFilterInputBloc.value.branchName!);
                var start = payrollFilterInputBloc.value.startDate;
                var end = payrollFilterInputBloc.value.endDate;
                var branch = payrollFilterInputBloc.value.branchName;
                Map<dynamic, dynamic> filter = {};
                sidebarBloc.value.calendarAppointments.forEach((element) {
                  if (start != null && start.isAfter(element.start)) return;
                  if (end != null && end.isBefore(element.start)) return;
                  if (branch == null || branch != element.branch.name) return;

                  var employeeName = element.employee.name;
                  var productSales = 0.0;
                  var serviceSales = 0.0;
                  var duration = element.end.difference(element.start);

                  element.products.forEach((element) {
                    productSales += element.cost;
                  });
                  element.services.forEach((element) {
                    serviceSales += element.cost;
                  });
                  if (filter.containsKey(employeeName)) {


                    filter[employeeName] = {
                      'hours': filter[employeeName]['hours'] +
                          duration.inMinutes / 60,
                      'product': filter[employeeName]['product'] + productSales,
                      'service': filter[employeeName]['service'] + serviceSales,
                      'tip': filter[employeeName]['tip'] + element.tip,
                    };
                  }
                  else{
                    filter[employeeName] = {
                      'hours':duration.inMinutes / 60,
                      'product': productSales,
                      'service': serviceSales,
                      'tip':  element.tip,
                    };
                  }
                });
                List<PayrollModel> payrolls = [];
                filter.forEach((key, value) {
                  payrolls.add(PayrollModel(
                      employeeName: key,
                      start: start ?? DateTime(0),
                      end: end ?? DateTime(9999),
                      tips: value['tip'].round(),
                      serviceCost: value['service'].round(),
                      productCost: value["product"].round(),
                      workingHours: value['hours'].round()));
                });
                payrollViewBloc.setPayrolls(payrolls);
                setState(() {
                  isLoading = false;
                });
              },
              child: Text('Submit'),
            ),
    );
  }
}
