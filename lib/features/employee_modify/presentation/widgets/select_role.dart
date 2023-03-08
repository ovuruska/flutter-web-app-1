

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/roles.dart';

class SelectRole extends StatefulWidget{

  final int? initialValue;
  final Function(int) onChanged;

  const SelectRole({Key? key, this.initialValue, required this.onChanged}) : super(key: key);


  @override
  _SelectRoleState createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  int _role = 0;


  @override
  Widget build(BuildContext context) {
    List<int> items = employeeRoles.keys.toList();
    return DropdownButton<int>(
      value: widget.initialValue ?? _role,
      items: items.map((int key) {
        return DropdownMenuItem<int>(
          value: key,
          child: Text(employeeRoles[key]!),
        );
      }).toList(),
      onChanged: (int? value) {
        setState(() {
          _role = value ?? 0;
          widget.onChanged(_role);
        });
      },
    );
  }
}