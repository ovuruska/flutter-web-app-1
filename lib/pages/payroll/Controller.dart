import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Payroll.dart';

import 'Model.dart';

class PayrollViewBloc extends Bloc<PayrollViewModel> {
  PayrollViewBloc() {
    subject.sink.add(PayrollViewModel());
  }

  setPayrolls(List<PayrollModel> payrolls) {
    subject.sink.add(subject.value.setPayrolls(payrolls));
  }
}

final payrollViewBloc = PayrollViewBloc();
