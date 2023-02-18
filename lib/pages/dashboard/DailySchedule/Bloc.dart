

import 'package:screenshot/screenshot.dart';
import 'package:scrubbers_employee_application/common/Bloc.dart';

import 'Model.dart';

class DashboardDailyScheduleBloc extends Bloc<DashboardDailyScheduleModel>{

  DashboardDailyScheduleBloc() {
    var model = DashboardDailyScheduleModel();
    subject.sink.add(model);
  }

  setScrollY(double y){
    subject.sink.add(subject.value.setScrollY(y));
  }

  setScreenshotController(ScreenshotController screenshotController){
    subject.sink.add(subject.value.setScreenshotController(screenshotController));
  }



}

final dashboardDailyScheduleBloc = DashboardDailyScheduleBloc();