

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scrubbers_employee_application/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'injection.dart';

Future<void> init() async{

  await dotenv.load(fileName: ".env");
  await FlutterFlowTheme.initialize();
  initSl();
  await SchedulingAuthService.instance.init();

  if (SchedulingAuthService.instance.isLogged()) {
    print("asdf");
    try {
    } catch (e) {
      ;
    }
  }

}