

import 'package:screenshot/screenshot.dart';

class DashboardDailyScheduleModel{
  double scrollY = 0;
  bool updated = false;
  ScreenshotController? screenshotController;

  setScreenshotController(ScreenshotController screenshotController){
    this.screenshotController = screenshotController;
    return this;
  }

  setScrollY(double y){
    scrollY = y;
    return this;
  }
}

final dashboardDailyScheduleModel = DashboardDailyScheduleModel();