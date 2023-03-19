

import 'package:flutter/material.dart';

import '../../features/tables/appointments_page_table/domain/callbacks/select_row_callback.dart';
import '../../injection.dart';
import 'layout.dart';
import 'select_item_callback.dart';

class AppointmentsView extends StatefulWidget {


  @override
  _AppointmentsViewState createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {

  void initState() {
    super.initState();
    sl.registerLazySingleton<AppointmentsPageTableSelectRowCallback>(() => AppointmentsPageTableSelectRowCallbackImpl());
  }


  @override
  Widget build(BuildContext context) {
    return AppointmentsLayout();
  }
}