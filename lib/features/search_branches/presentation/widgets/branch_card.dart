import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

class BranchCard extends StatelessWidget {
  final Branch branch;
  final Function onPressed;
  final bool selected;

  const BranchCard({Key? key, required this.branch, required this.onPressed,this.selected=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var branchName = branch.name;
    var firstLetter = (branchName != null && branchName.isNotEmpty) ? branchName[0].toUpperCase() : '';
    return ListTile(
      selected: selected,
      selectedColor: Colors.grey.shade300,
      leading:CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text(
          firstLetter,
          style: TextStyle(

            color: Colors.white,
          ),
        ),
      ),
      title: Text(branchName),
      onTap: () => onPressed(),

    );
  }


}
