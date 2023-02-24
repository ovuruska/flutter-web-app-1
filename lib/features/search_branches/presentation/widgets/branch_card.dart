import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

class BranchCard extends StatelessWidget {
  final Branch branch;
  final Function onPressed;

  const BranchCard({Key? key, required this.branch, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var branchName = branch.name;
    return ListTile(
      leading:CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text(
          branchName[0],
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
