import 'package:scrubbers_employee_application/common/Bloc.dart';

import 'Model.dart';

class PayrollFilterInputBloc extends Bloc<PayrollFilterInputModel> {

  PayrollFilterInputBloc(){
    subject.sink.add(PayrollFilterInputModel());
  }

  setStartDate(DateTime? value) {
    subject.sink.add(subject.value.setStartDate(value));
  }

  setEndDate(DateTime? value) {
    subject.sink.add(subject.value.setEndDate(value));
  }

  setBranchName(String? value) {
    subject.sink.add(subject.value.setBranchName(value));
  }
}

final payrollFilterInputBloc = PayrollFilterInputBloc();
