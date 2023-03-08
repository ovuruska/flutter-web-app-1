import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/employee_search/register.dart';
import 'package:scrubbers_employee_application/features/modify_branch/register.dart';
import 'package:scrubbers_employee_application/features/search_branches/register.dart';
import 'package:scrubbers_employee_application/features/view_logs/register.dart';

import 'features/create_appointment/register.dart';
import 'features/employee_working_hours/register.dart';
import 'features/rebook_appointment/register.dart';

final sl = GetIt.instance;

Future<void> initSl() async{

  registerModifyBranchFeature(sl);

  registerSearchBranchesFeature(sl);
  registerViewLogs(sl);
  registerCreateAppointment(sl);
  registerRebookAppointment(sl);
  registerEmployeeSearch(sl);
  registerEmployeeWorkingHours(sl);
}