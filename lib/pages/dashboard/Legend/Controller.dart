


import 'package:scrubbers_employee_application/models/Employee.dart';

import '../../../common/Bloc.dart';
import 'Model.dart';

class DashboardLegendBloc extends Bloc<DashboardLegendModel>{
  DashboardLegendBloc(){
    subject.sink.add(DashboardLegendModel());
  }

  setDropdownValue(String value){
    subject.sink.add(subject.value.setDropdownValue(value));
  }
  setEmployee(Employee employee){
    subject.sink.add(subject.value.setEmployee(employee));
  }
  clearEmployee(){
    subject.sink.add(subject.value.clearEmployee());
  }
}

final dashboardLegendBloc = DashboardLegendBloc();