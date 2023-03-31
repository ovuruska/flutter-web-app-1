import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/domain/entities/employee_entity.dart';
import '../../../../../injection.dart';
import '../bloc/employee_search_bloc.dart';
import '../bloc/employee_search_event.dart';
import 'employee_list.dart';

class EmployeeSearch extends StatefulWidget {
  final List<EmployeeEntity> employees;
  final int? selected;
  final Function(EmployeeEntity)? onPressed;

  const EmployeeSearch({Key? key, required this.employees, this.onPressed, this.selected}) : super(key: key);

  @override
  _EmployeeSearchState createState() => _EmployeeSearchState();
}

class _EmployeeSearchState extends State<EmployeeSearch> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Employees",
            style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF2D7CB6),
            ),
          ),
          TextButton(onPressed: () {
            sl<EmployeeSearchBloc>().add(EmployeeSearchEventCreate());
          }, child: Text(
            "Create New +",
            style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF2D7CB6),
            ),
          ))
        ],

      ),
      Container(height:16),
      Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: editingController,
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black38),
                  prefixIcon: Icon(Icons.search, color:const Color(0xFF2D7CB6))),
            ),
          )

        ],
      ),
      Container(height:16),

      Expanded(
        child:SingleChildScrollView(
          child: EmployeeList(
            selected: widget.selected,
              employees: widget.employees
                  .where(
                      (element) => element.name.contains(editingController.text))
                  .toList(),
              onPressed: (branch) {
                if (widget.onPressed != null) {
                  widget.onPressed!(branch);
                }
              }),
        )
      )


    ]);
  }
}
