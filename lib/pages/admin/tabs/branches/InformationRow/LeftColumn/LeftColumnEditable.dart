import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/Controller.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/InformationRow/Controller.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../utils.dart';

class AdminBranchesTabInformationRowLeftColumnEditable extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var currentIndex = adminBranchesTabBloc.value.currentIndex;
    var branch = branchesBloc.value.branches[currentIndex];
  var totalInvoice = totalInvoiceOfBranch(branch);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(BoldText(text: "ID")),
            textPadding(BoldText(text: "Total Invoice")),
            Flexible(
              child:ClearableTextInput(
                label: "Name",
                initialValue: branch.name,
                onChanged: (String? value) {
                  if(value == null){
                    adminBranchesTabInformationRowBloc.setName("");
                  }else{
                    adminBranchesTabInformationRowBloc.setName(value);
                  }
                },),
            ),



            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(InfoText(text: branch.id.toString())),
              textPadding(InfoText(text: StringUtils.formatCurrency(totalInvoice))),
            ],
          )
        ],
      ),
    );
  }

}