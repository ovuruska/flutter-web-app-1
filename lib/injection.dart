import 'package:get_it/get_it.dart';


import 'features/analytics/client_cancellation_rate/register.dart';
import 'features/analytics/client_no_show_rate/register.dart';
import 'features/analytics/client_top_category/register.dart';
import 'features/analytics/client_visits/register.dart';
import 'features/analytics/client_yearly_appointment/register.dart';
import 'features/app_calendar/register.dart';
import 'features/app_select_branch/register.dart';
import 'features/appointment_schedule/register.dart';
import 'features/create_appointment/register.dart';
import 'features/forms/branch_modify/register.dart';
import 'features/forms/employee_modify/register.dart';
import 'features/forms/employee_working_hours/register.dart';
import 'features/information/appointment_tabs/register.dart';
import 'features/information/client_information/register.dart';
import 'features/information/client_pets/register.dart';
import 'features/information/transactions_grid/register.dart';
import 'features/rebook_appointment/register.dart';
import 'features/sidebars/branch_search/register.dart';
import 'features/sidebars/client_search/register.dart';
import 'features/sidebars/employee_search/register.dart';
import 'features/tables/client_appointments/register.dart';
import 'pages/clients/register.dart';

final sl = GetIt.instance;

Future<void> initSl() async {
  sl.allowReassignment=true;

  registerModifyBranchFeature(sl);
  registerSearchBranchesFeature(sl);
  registerViewLogs(sl);
  registerCreateAppointment(sl);
  registerRebookAppointment(sl);
  registerEmployeeSearch(sl);
  registerEmployeeWorkingHours(sl);
  registerEmployeeModify(sl);
  registerViewAppointments(sl);
  registerAppointmentSchedule(sl);
  registerAppSelectBranch(sl);
  registerClientSearch(sl);
  registerClientAppointments(sl);
  registerClientInformation(sl);
  registerClientsView(sl);
  registerClientTopCategory(sl);
  registerCancellationRate(sl);
  registerNoShowRate(sl);
  registerClientVisits(sl);
  registerClientPets(sl);
  registerClientYearlyAppointments(sl);
  registerAppCalendar(sl);
}
