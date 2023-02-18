

import 'package:scrubbers_employee_application/common/Bloc.dart';

import 'model.dart';

class SidebarCalendarBloc extends Bloc<SidebarCalendarModel>{
  SidebarCalendarBloc(){
    subject.sink.add(SidebarCalendarModel());
  }

  setDate(DateTime date){
    subject.sink.add(subject.value.setDate(date));
  }

  toggleExpanded(){
    subject.sink.add(subject.value.toggleExpanded());
  }
}

final sidebarCalendarBloc = SidebarCalendarBloc();