import 'package:flutter/material.dart';
import '../../domain/entities/employee_entity.dart';


class EmployeeCard extends StatelessWidget {
  final EmployeeEntity employee;
  final Function onPressed;
  final bool selected;

  const EmployeeCard({Key? key, required this.employee, required this.onPressed,this.selected=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var employeeName = employee.name;
    var firstLetter = (employeeName != null && employeeName.isNotEmpty) ? employeeName[0].toUpperCase() : '';
    var surnameFirstLetter = employeeName.split(' ').length > 1 ? employeeName.split(' ')[1][0].toUpperCase() : '';
    return ListTile(
      selected: selected,
      selectedColor: Colors.grey.shade300,
      leading:CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text(
          firstLetter + surnameFirstLetter,
          style: TextStyle(

            color: Colors.white,
          ),
        ),
      ),
      title: Text(employeeName),
      onTap: () => onPressed(),

    );
  }


}
