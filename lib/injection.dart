import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/available_slots/register.dart';
import 'package:scrubbers_employee_application/features/forms/branch_working_hours/register.dart';
import 'package:scrubbers_employee_application/features/ticket_information/register.dart';


import 'core/register.dart';
import 'features/analytics/client_cancellation_rate/register.dart';
import 'features/analytics/client_no_show_rate/register.dart';
import 'features/analytics/client_top_category/register.dart';
import 'features/analytics/client_visits/register.dart';
import 'features/analytics/client_yearly_appointment/register.dart';
import 'features/app_calendar/register.dart';
import 'features/app_multi_calendar/register.dart';
import 'features/app_select_branch/register.dart';
import 'features/appointment_schedule/register.dart';
import 'features/available_branch_slots/register.dart';
import 'features/forms/average_service_time/register.dart';
import 'features/forms/branch_information_crud/register.dart';
import 'features/forms/client_autocomplete/register.dart';
import 'features/forms/employee_information_crud/register.dart';
import 'features/forms/employee_modify/register.dart';
import 'features/forms/employee_working_hours/register.dart';
import 'features/forms/multi_branch_select/register.dart';
import 'features/forms/multi_groomer_select/register.dart';
import 'features/forms/multi_product_select/register.dart';
import 'features/forms/rebook_appointment_2/register.dart';
import 'features/information/appointment_tabs/register.dart';
import 'features/information/client_information/register.dart';
import 'features/information/client_pets/register.dart';
import 'features/information/transactions_grid/register.dart';
import 'features/sidebars/branch_search/register.dart';
import 'features/sidebars/client_search/register.dart';
import 'features/sidebars/daily_column/register.dart';
import 'features/sidebars/employee_search/register.dart';
import 'features/tables/appointments_page_table/register.dart';
import 'features/tables/client_appointments_table/register.dart';
import 'pages/clients/register.dart';

final sl = GetIt.instance;

void initSl()  {
  sl.allowReassignment=true;

  registerCore(sl);

  registerSearchBranchesFeature(sl);
  registerViewLogs(sl);
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
  registerAppointmentsPageTable(sl);
  registerDailyColumn(sl);
  registerRebookAppointment2(sl);
  registerAverageServiceTime(sl);
  registerMultiGroomerSelect(sl);
  registerAppMultiCalendar(sl);
  registerMultiProductSelect(sl);
  registerMultiBranchSelect(sl);
  registerAvailableSlots(sl);
  registerEmployeeInformationCrud(sl);
  registerClientAutocomplete(sl);
  registerTicketInformation(sl);
  registerBranchInformationCrud(sl);
  registerBranchWorkingHours(sl);
  registerAvailableBranchSlots(sl);
}
