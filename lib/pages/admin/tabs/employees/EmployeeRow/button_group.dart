import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/employees/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';
import 'package:scrubbers_employee_application/repositories/employee.dart';

import '../controller.dart';
import 'controller.dart';

class AdminEmployeeTabEmployeeRowButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminEmployeeTabBloc.stream,
      listener: (value) {},
      builder: (context, _) => _build(context));

  Widget _button(Widget child) {
    return SizedBox(width: 160, height: 48, child: child);
  }

  Widget _build(BuildContext context) {
    var editable = adminEmployeeTabBloc.value.editable;
    var disabled = (adminEmployeeTabBloc.getCurrent() == null);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button(
            ElevatedButton(
              child: Text("Create employee"),
              style: ElevatedButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              onPressed: () {
                adminEmployeeTabBloc.setEditable();

                EmployeeRepository.instance.init().then((employee) {
                  employeesBloc.addEmployee(employee);
                  var totalEmployees = employeesBloc.value.employees.length;

                  adminEmployeeTabBloc.setCurrentIndex(totalEmployees - 1);
                });
              },
            ),
          ),
          (editable)
              ? _button(
                  ElevatedButton(
                    child: Text("Save employee"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    onPressed: (disabled)
                        ? null
                        : () {
                            adminEmployeeTabBloc.clearEditable();
                            var currentIndex =
                                adminEmployeeTabBloc.value.currentIndex;
                            var branch =
                                adminEmployeeTabEmployeeRowBloc.value.branch;
                            var role =
                                adminEmployeeTabEmployeeRowBloc.value.role;
                            var name =
                                adminEmployeeTabEmployeeRowBloc.value.name;
                            var phoneNumber =
                                adminEmployeeTabEmployeeRowBloc.value.phone;
                            var employee = employeesBloc.updateEmployee(currentIndex,
                                branch: branch,
                                role: role,
                                name: name,
                                phone: phoneNumber);
                            EmployeeRepository.instance.modify(employee).then((value) {
                              showSnackbar(context, "Employee successfully updated.");
                            });
                          },
                  ),
                )
              : _button(
                  ElevatedButton(
                    child: Text("Edit employee"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    onPressed: (disabled)
                        ? null
                        : () {
                            adminEmployeeTabBloc.setEditable();
                          },
                  ),
                ),
          _button(ElevatedButton(
            child: Text("Delete employee"),
            style: ElevatedButton.styleFrom(
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            onPressed: (disabled)
                ? null
                : () {
                    var employee = adminEmployeeTabBloc.getCurrent();
                    EmployeeRepository.instance
                        .removeEmployee(employee?.id ?? "")
                        .then((value) {
                      var currentIndex =
                          adminEmployeeTabBloc.value.currentIndex;
                      employeesBloc.removeEmployee(currentIndex);
                      adminEmployeeTabBloc.prevIndex();
                    });
                  },
          ))
        ],
      ),
    );
  }
}
