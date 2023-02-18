import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';

import '../utils.dart';

class AdminBranchesTabInformationRowRightColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    Branch? branch = adminBranchesTabBloc.getCurrentBranch();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(BoldText(text: "Description")),
              textPadding(BoldText(text: "Phone number")),
              textPadding(BoldText(text: "Address")),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(InfoText(text: branch?.description ?? "")),
              textPadding(InfoText(text: branch?.phone ?? "")),
              textPadding(InfoText(text: branch?.address ?? "")),
            ],
          )
        ],
      ),
    );
  }
}
