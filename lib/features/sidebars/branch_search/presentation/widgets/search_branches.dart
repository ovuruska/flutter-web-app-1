import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';

import '../../../../../injection.dart';
import '../bloc/search_branches_bloc.dart';
import '../bloc/search_branches_event.dart';
import 'branch_list.dart';

class SearchBranches extends StatefulWidget {
  final List<BranchEntity> branches;

  final Function(BranchEntity)? onPressed;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Branches",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF2D7CB6),
            ),
          ),
          TextButton(onPressed: () {
          sl<SearchBranchesBloc>().add(SearchBranchesEventCreate());
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
                  hintText: "Search Branch",
                  hintStyle: TextStyle(color: Colors.black38),
                  prefixIcon: Icon(Icons.search, color: const Color(0xFF2D7CB6))),
            ),
          ),

        ],
      ),
      Container(height:16),

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
