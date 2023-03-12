import 'package:flutter/material.dart';

import '../../domain/entities/branch_id_and_name.dart';

class SelectBranch extends StatefulWidget {
  final Function(int)? onBranchSelected;
  final List<BranchIdAndName> branches;
  const SelectBranch(
      {Key? key, required this.onBranchSelected, required this.branches})
      : super(key: key);

  @override
  _SelectBranchState createState() => _SelectBranchState();
}

class _SelectBranchState extends State<SelectBranch> {
  late int? _selectedBranch;

  @override
  void initState() {
    super.initState();
    if(widget.branches.isNotEmpty){
      _selectedBranch = widget.branches.first.id;
      Future.delayed(Duration.zero, () {
        if (widget.onBranchSelected != null)
          widget.onBranchSelected!(_selectedBranch!);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      value: _selectedBranch,
      onChanged: (value) {
        setState(() {
          _selectedBranch = value;
        });
        if (widget.onBranchSelected != null) widget.onBranchSelected!(value!);
      },
      items: widget.branches
          .map((e) => DropdownMenuItem(
                value: e.id,
                child: Text(e.name),
              ))
          .toList(),
    );
  }
}
