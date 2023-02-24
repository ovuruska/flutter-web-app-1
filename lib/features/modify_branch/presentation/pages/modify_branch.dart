import 'package:flutter/material.dart';

import '../../../../models/Branch.dart';

class ModifyBranch extends StatefulWidget {
  final Branch branch;

  const ModifyBranch({Key? key, required this.branch}) : super(key: key);

  @override
  _ModifyBranchState createState() => _ModifyBranchState();
}

class _ModifyBranchState extends State<ModifyBranch> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Branch #${widget.branch.id}"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Modify Branch"),
            Text("Branch Name: ${widget.branch.name}"),
            Text("Branch Address: ${widget.branch.address}"),
            Text("Branch Phone: ${widget.branch.phone}"),
            Text("Branch Email: ${widget.branch.email}"),
          ],
        ),
      ),
    );
  }
  
}
