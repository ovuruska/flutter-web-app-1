

import 'package:flutter/material.dart';

import '../../features/tables/appointments_page_table/domain/callbacks/deselect_row_callback.dart';
import '../../features/tables/appointments_page_table/domain/callbacks/select_row_callback.dart';
import '../../injection.dart';
import 'layout.dart';
import 'callbacks.dart';

class AppointmentsView extends StatefulWidget {


  @override
  _AppointmentsViewState createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {

  void initState() {
    super.initState();
    sl.registerLazySingleton<AppointmentsPageTableSelectRowCallback>(() => AppointmentsPageTableSelectRowCallbackImpl());
    sl.registerLazySingleton<AppointmentsPageTableDeSelectRowCallback>(() => AppointmentsPageTableDeSelectRowCallbackImpl());
  }


  @override
  Widget build(BuildContext context) {
    return AppointmentsLayout();
  }
}