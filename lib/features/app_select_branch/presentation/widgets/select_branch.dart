import 'package:flutter/material.dart';

import '../../domain/entities/branch_id_and_name.dart';

class SelectBranch extends StatelessWidget {
  final Function(BranchIdAndName?)? onBranchSelected;
  final List<BranchIdAndName> branches;
  final BranchIdAndName? selectedBranch;
  const SelectBranch(
      {Key? key, required this.onBranchSelected, required this.branches, this.selectedBranch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Branch', style: TextStyle(fontFamily: "Poppins", fontSize: 20)),
      Container(height: 8),
      DropdownButtonFormField<BranchIdAndName>(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        value: selectedBranch,
        onChanged: (value) {
          if (onBranchSelected != null) onBranchSelected!(value);
        },
        items: branches
            .map((e) => DropdownMenuItem<BranchIdAndName>(
                  value: e,
                  child: Text(
                    e.name,
                    style: TextStyle(fontFamily: "Poppins"),
                  ),
                ))
            .toList(),
      )
    ]);
  }
}
