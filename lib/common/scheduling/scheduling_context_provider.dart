import 'package:flutter/material.dart';
import 'scheduling_context.dart';

class SchedulingContextProvider extends InheritedWidget {

  final SchedulingContext schedulingContext;


  SchedulingContextProvider({required Widget child,required this.schedulingContext}) : super(child: child);

  static SchedulingContext of(BuildContext context) {
    final SchedulingContextProvider? result =
    context.dependOnInheritedWidgetOfExactType<SchedulingContextProvider>();
    if (result == null) {
      throw FlutterError('No SchedulingContextProvider is found in the widget tree');
    }
    return result.schedulingContext;
  }

  @override
  bool updateShouldNotify(SchedulingContextProvider oldWidget) {
    return schedulingContext != oldWidget.schedulingContext;
  }
}