import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_event.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'injection.dart';

Future<void> init() async {
  await dotenv.load(fileName: ".env");
  await FlutterFlowTheme.initialize();
  initSl();
  await SchedulingAuthService.instance.init();

  if (SchedulingAuthService.instance.isLogged()) {
    try {
      sl<AppSelectBranchBloc>().add(
        AppSelectBranchEventGetAll(),
      );
    } catch (e) {
      ;
    }
  }
}
