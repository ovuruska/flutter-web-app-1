import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

import '../../../../../common/get_it_maybe.dart';
import '../../../../../common/quicker/inputs/text_field.dart';
import '../../../../../injection.dart';
import '../../domain/employee_information_updated.dart';
import '../bloc/employee_information_crud_bloc.dart';
import '../bloc/employee_information_crud_event.dart';

class EmployeeInformationCrud extends StatefulWidget {
  final EmployeeEntity employee;

  const EmployeeInformationCrud({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  _EmployeeInformationCrudState createState() =>
      _EmployeeInformationCrudState();
}

class _EmployeeInformationCrudState extends State<EmployeeInformationCrud> {
  Widget _header(String label) => Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFE5E9EB), width: 1))),
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(label,
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000)))
      ]));

  saveName(String? value) {
    var newEmployee = widget.employee.copyWith(name: value);
    sl<EmployeeInformationCrudBloc>()
        .add(EmployeeInformationCrudEventPatch(employee: newEmployee));
    getItMaybe<EmployeeInformationUpdatedCallback>()?.call(newEmployee);
  }

  saveEmail(String? value) {
    var newEmployee = widget.employee.copyWith(email: value);
    sl<EmployeeInformationCrudBloc>()
        .add(EmployeeInformationCrudEventPatch(employee: newEmployee));
    getItMaybe<EmployeeInformationUpdatedCallback>()?.call(newEmployee);

  }

  savePhone(String? value) {
    var newEmployee = widget.employee.copyWith(phone: value);
    sl<EmployeeInformationCrudBloc>()
        .add(EmployeeInformationCrudEventPatch(employee: newEmployee));
    getItMaybe<EmployeeInformationUpdatedCallback>()?.call(newEmployee);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Color(0xFFE5E9EB), width: 1)),
        child: Column(children: [
          _header("Employee Information"),
          Divider(
            color: Color(0xFFE5E9EB),
            thickness: 1,
            height: 1,
          ),
          QuickerTextField(
            labelText: "Employee Id",
            initialValue: widget.employee.id.toString(),
            enabled: false,
          ),
          Divider(
            color: Color(0xFFE5E9EB),
            thickness: 1,
            height: 1,
          ),
          QuickerTextField(
              labelText: "Name",
              initialValue: widget.employee.name.toString(),
              onSaved: saveName),
          Divider(
            color: Color(0xFFE5E9EB),
            thickness: 1,
            height: 1,
          ),
          QuickerTextField(
              labelText: "Email",
              initialValue: widget.employee.email.toString(),
              onSaved: saveEmail),
          Divider(
            color: Color(0xFFE5E9EB),
            thickness: 1,
            height: 1,
          ),
          QuickerTextField(
              labelText: "Phone",
              initialValue: widget.employee.phone.toString(),
              onSaved: savePhone),
        ]));
  }
}
