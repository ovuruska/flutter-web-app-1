import 'package:flutter/material.dart';

import '../../../../core/domain/entities/branch_entity.dart';


class SelectBranch extends StatelessWidget {
  final Function(BranchEntity?)? onBranchSelected;
  final List<BranchEntity> branches;
  final BranchEntity? selectedBranch;
  const SelectBranch(
      {Key? key, required this.onBranchSelected, required this.branches, this.selectedBranch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Branch', style: TextStyle(fontFamily: "Poppins", fontSize: 20)),
      Container(height: 8),
      DropdownButtonFormField<BranchEntity>(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        value: selectedBranch,
        onChanged: (value) {
          if (onBranchSelected != null) onBranchSelected!(value);
        },
        items: branches
            .map((e) => DropdownMenuItem<BranchEntity>(
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
