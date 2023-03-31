

import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/branch_entity.dart';
import 'branch_card.dart';

class BranchList extends StatelessWidget {
  final List<BranchEntity> branches;
  final Function(BranchEntity) onPressed;

  const BranchList({Key? key, required this.branches, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: branches.length,
        itemBuilder: (context, index) {
        var branch = branches[index];
          return BranchCard(
            key:Key(branch.name),
            branch: branches[index],
            onPressed: () => onPressed(branches[index]),
          );
        });
  }
}