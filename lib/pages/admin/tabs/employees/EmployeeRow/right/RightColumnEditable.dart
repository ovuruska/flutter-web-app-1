import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ClearableTextInput.dart';

import '../../controller.dart';
import '../controller.dart';
import '../utils.dart';
import 'SelectBranch.dart';
import 'utils.dart';

class AdminEmployeeTabEmployeeRowRightColumnEditable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var employee = adminEmployeeTabBloc.getCurrent();
    var totalInvoice = 0.0;
    if(employee != null) totalInvoice = totalInvoiceOfEmployee(employee);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(BoldText(text: "ID")),
              Flexible(
                child:ClearableTextInput(
                  label: "Phone number",
                  initialValue: employee?.phone ?? "",
                  onChanged: (String? value) {
                    if(value == null){
                      adminEmployeeTabEmployeeRowBloc.setPhone("");
                    }else{
                      adminEmployeeTabEmployeeRowBloc.setPhone(value);
                    }
                  },),
              ),
              Flexible(
                  child:AdminEmployeeTabEmployeeRowRightColumnSelectBranch()
              )


            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPadding(InfoText(text: StringUtils.formatCurrency(totalInvoice),)),
            ],
          )
        ],
      ),
    );
  }
}