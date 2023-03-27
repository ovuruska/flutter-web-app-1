import 'package:flutter/material.dart';

import '../../../../../injection.dart';
import '../../../../../models/Branch.dart';
import '../bloc/search_branches_bloc.dart';
import '../bloc/search_branches_event.dart';
import 'branch_list.dart';

class SearchBranches extends StatefulWidget {
  final List<Branch> branches;

  final Function(Branch)? onPressed;

  const SearchBranches({Key? key, required this.branches, this.onPressed}) : super(key: key);

  @override
  _SearchBranchesState createState() => _SearchBranchesState();
}

class _SearchBranchesState extends State<SearchBranches> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [

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
                  prefixIcon: Icon(Icons.search, color: Colors.black38)),
            ),
          ),
          IconButton(
            icon:const Icon(Icons.add),
            onPressed: () {
              sl<SearchBranchesBloc>().add(CreateNewBranchEvent());
            },

          )

        ],
      ),

      SingleChildScrollView(
        child: BranchList(
            branches: widget.branches
                .where(
                    (element) => element.name.contains(editingController.text))
                .toList(),
            onPressed: (branch) {
              if (widget.onPressed != null) {
                widget.onPressed!(branch);
              }
            }),
      )
    ]);
  }
}
