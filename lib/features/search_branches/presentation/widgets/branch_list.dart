

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

import 'branch_card.dart';

class BranchList extends StatelessWidget {
  final List<Branch> branches;
  final Function(Branch) onPressed;

  const BranchList({Key? key, required this.branches, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: branches.length,
        itemBuilder: (context, index) {
          return BranchCard(
            branch: branches[index],
            onPressed: () => onPressed(branches[index]),
          );
        });
  }
}