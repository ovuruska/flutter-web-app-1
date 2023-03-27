import 'package:flutter/material.dart';

import 'rebook_context.dart';



class RebookContextProvider extends InheritedNotifier<RebookContext> {

  RebookContextProvider({
    Key? key,
    required Widget child,
    required RebookContext notifier,
  }) : super(key: key, child: child,notifier: notifier);

  static RebookContextProvider of(BuildContext context) {
    RebookContextProvider? result = context.dependOnInheritedWidgetOfExactType<RebookContextProvider>();
    if (result == null) {
      throw FlutterError('No RebookContextProvider is found in the widget tree');
    }
    return result;
  }


}