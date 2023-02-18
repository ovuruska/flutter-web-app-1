

import 'package:scrubbers_employee_application/models/Payroll.dart';

class PayrollViewModel{

  List<PayrollModel> payrolls = [];
  PayrollViewModel(){
    payrolls = [];
  }

  setPayrolls(List<PayrollModel> payrolls){
    this.payrolls = payrolls;
    return this;
  }


}