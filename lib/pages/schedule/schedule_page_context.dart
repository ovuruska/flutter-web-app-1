import 'package:flutter/material.dart';

class SchedulePageContext extends ChangeNotifier {

  int _selectedIndex = 2;
  bool _isFullScreen = false;

  SchedulePageContext();

  bool get isFullScreen => _isFullScreen;
  int get selectedIndex => _selectedIndex;

  void setFullScreen(bool isFullScreen) {
    _isFullScreen = isFullScreen;
    notifyListeners();

  }

  void setSelectedIndex(int selectedIndex) {
    _selectedIndex = selectedIndex;
    notifyListeners();

  }


}

class SchedulePageContextProvider extends InheritedNotifier<SchedulePageContext> {

  SchedulePageContextProvider({
    Key? key,
    required Widget child,
    required SchedulePageContext notifier,
  }) : super(key: key, child: child,notifier: notifier);

  static SchedulePageContextProvider of(BuildContext context) {
    SchedulePageContextProvider? result = context.dependOnInheritedWidgetOfExactType<SchedulePageContextProvider>();
    if (result == null) {
      throw FlutterError('No SchedulePageContextProvider is found in the widget tree');
    }
    return result;
  }


}