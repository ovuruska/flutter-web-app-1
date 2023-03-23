import 'package:flutter/material.dart';

import '../../core/domain/entities/branch_entity.dart';
import '../../core/domain/entities/employee_entity.dart';

class AdminPageContext extends ChangeNotifier {

  int _selectedIndex = 0;

  AdminPageContext();

  int get selectedIndex => _selectedIndex;



  void setSelectedIndex(int selectedIndex) {
    _selectedIndex = selectedIndex;
    notifyListeners();

  }



}

class AdminPageContextProvider extends InheritedNotifier<AdminPageContext> {

  AdminPageContextProvider({
    Key? key,
    required Widget child,
    required AdminPageContext notifier,
  }) : super(key: key, child: child,notifier: notifier);

  static AdminPageContextProvider of(BuildContext context) {
    AdminPageContextProvider? result = context.dependOnInheritedWidgetOfExactType<AdminPageContextProvider>();
    if (result == null) {
      throw FlutterError('No AdminPageContextProvider is found in the widget tree');
    }
    return result;
  }


}