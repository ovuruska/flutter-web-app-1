import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

import 'branch_list.dart';

class SearchBranches extends StatefulWidget {
  final List<Branch> branches;

  const SearchBranches({Key? key, required this.branches}) : super(key: key);

  @override
  _SearchBranchesState createState() => _SearchBranchesState();
}

class _SearchBranchesState extends State<SearchBranches> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      TextField(
        onChanged: (value) {
          setState(() {});
        },
        controller: editingController,
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.search, color: Colors.white)),
      ),
      SingleChildScrollView(
        child: BranchList(
            branches: widget.branches
                .where(
                    (element) => element.name.contains(editingController.text))
                .toList(),
            onPressed: (branch) {}),
      )
    ]));
  }
}
