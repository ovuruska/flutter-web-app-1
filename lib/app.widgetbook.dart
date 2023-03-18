// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:card_settings/card_settings.dart';
import 'package:card_settings/helpers/platform_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:scrubbers_employee_application/app.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/common/basic/blue_shadow.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/appointment_layout.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgetbook/appointment_card.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgetbook/appointment_schedule.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgetbook/daily_calendar.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/appointment_card.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/daily_calendar.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/hour_box.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/hour_column.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/resizable.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/border.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/constants.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/layout_appointments.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/on_accept_with_details.dart';
import 'package:scrubbers_employee_application/features/client_appointments/presentation/widgets/percent_indicator.dart';
import 'package:scrubbers_employee_application/features/client_appointments/presentation/widgets/pet_item.dart';
import 'package:scrubbers_employee_application/features/client_cancellation_rate/widgetbook/cancellation_rate.dart';
import 'package:scrubbers_employee_application/features/client_information/domain/entities/client_information.dart';
import 'package:scrubbers_employee_application/features/client_information/widgetbook/client_information_loaded.dart';
import 'package:scrubbers_employee_application/features/client_information/widgetbook/client_information_loading.dart';
import 'package:scrubbers_employee_application/features/client_no_show_rate/widgetbook/no_show_rate.dart';
import 'package:scrubbers_employee_application/features/client_pets/domain/entities/client_pet_item.dart';
import 'package:scrubbers_employee_application/features/client_pets/widgetbook/all_pets.dart';
import 'package:scrubbers_employee_application/features/client_pets/widgetbook/pet_item.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_dog_entity.dart';
import 'package:scrubbers_employee_application/features/client_top_category/presentation/widgetbook/client_top_category.dart';
import 'package:scrubbers_employee_application/features/client_top_category/presentation/widgetbook/top_category_chart.dart';
import 'package:scrubbers_employee_application/features/client_top_category/presentation/widgets/top_category_chart.dart';
import 'package:scrubbers_employee_application/features/client_visits/presentation/widgets/visits_pie_chart.dart';
import 'package:scrubbers_employee_application/features/client_visits/widgetbook/client_visits.dart';
import 'package:scrubbers_employee_application/features/client_visits/widgetbook/visits_pie_chart.dart';
import 'package:scrubbers_employee_application/features/client_visits/widgetbook/visits_pie_chart_2.dart';
import 'package:scrubbers_employee_application/features/create_appointment/domain/all_breeds.dart';
import 'package:scrubbers_employee_application/features/create_appointment/domain/entities/appointment_entity.dart';
import 'package:scrubbers_employee_application/features/create_appointment/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/features/create_appointment/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/features/create_appointment/presentation/widgets/appointment_section.dart';
import 'package:scrubbers_employee_application/features/create_appointment/presentation/widgets/branch_section.dart';
import 'package:scrubbers_employee_application/features/create_appointment/presentation/widgets/customer_section.dart';
import 'package:scrubbers_employee_application/features/create_appointment/widgetbook/appointment_section.dart';
import 'package:scrubbers_employee_application/features/create_appointment/widgetbook/branch_section.dart';
import 'package:scrubbers_employee_application/features/create_appointment/widgetbook/create_appointment_form.dart';
import 'package:scrubbers_employee_application/features/create_appointment/widgetbook/customer_section.dart';
import 'package:scrubbers_employee_application/features/modify_branch/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/features/modify_branch/domain/usecases/save_branch.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_event.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_state.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/widgets/branch_card_settings.dart';
import 'package:scrubbers_employee_application/features/modify_branch/register.dart';
import 'package:scrubbers_employee_application/features/modify_branch/widgetbook/branch_card_settings.dart';
import 'package:scrubbers_employee_application/features/modify_branch/widgetbook/modify_branch.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/bloc/search_branches_bloc.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/bloc/search_branches_event.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/widgets/branch_card.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/widgets/branch_list.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/widgets/search_branches.dart';
import 'package:scrubbers_employee_application/features/search_branches/widgetbook/branch_card.dart';
import 'package:scrubbers_employee_application/features/search_branches/widgetbook/branch_list.dart';
import 'package:scrubbers_employee_application/features/search_branches/widgetbook/search_branches.dart';
import 'package:scrubbers_employee_application/features/view_logs/domain/entity/log_entity.dart';
import 'package:scrubbers_employee_application/features/view_logs/presentation/widgets/card_description.dart';
import 'package:scrubbers_employee_application/features/view_logs/presentation/widgets/log_card.dart';
import 'package:scrubbers_employee_application/features/view_logs/widgetbook/card_description.dart';
import 'package:scrubbers_employee_application/features/view_logs/widgetbook/log_card.dart';
import 'package:scrubbers_employee_application/features/view_logs/widgetbook/log_list.dart';
import 'package:scrubbers_employee_application/features/view_logs/widgetbook/log_tabs.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/injection.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/widgets/cards/index.dart';
import 'package:scrubbers_employee_application/widgets/cards/root/appointment_card.dart';
import 'package:scrubbers_employee_application/widgets/cards/root/entity.dart';
import 'package:scrubbers_employee_application/widgets/cards/wrapper.dart';
import 'package:scrubbers_employee_application/widgets/inputs/ControlledCalendar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'Quicker',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Dark',
          data: darkTheme(),
        ),
      ],
      devices: [
        Device(
          name: 'Macbook Pro',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 900.0,
              width: 1440.0,
            ),
            scaleFactor: 1.0,
          ),
          type: DeviceType.desktop,
        ),
      ],
      textScaleFactors: [
        1.0,
        2.0,
        3.0,
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'widgets',
              widgets: [
                WidgetbookComponent(
                  name: 'CardSettingsSection',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Customer Section',
                      builder: (context) => customerSectionUseCase(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Customer Section',
                      builder: (context) => appointmentSectionUseCase(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Branch Section Empty',
                      builder: (context) => branchSectionUseCase(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Branch Section Filled',
                      builder: (context) => branchFilledUseCase(context),
                    ),
                  ],
                  isExpanded: true,
                ),
              ],
              folders: [
                WidgetbookFolder(
                  name: 'cards',
                  widgets: [
                    WidgetbookComponent(
                      name: 'AppointmentCardCancelled',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Appointment Card Cancelled',
                          builder: (context) =>
                              appointmentCardCancelledUseCase(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'AppointmentCardApproved',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Appointment Card Approved',
                          builder: (context) =>
                              appointmentCardApprovedUseCase(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'AppointmentCardCompleted',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Appointment Card Completed',
                          builder: (context) =>
                              appointmentCardCompletedUseCase(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'AppointmentCardPending',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Appointment Card Pending',
                          builder: (context) =>
                              appointmentCardPendingUseCase(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'AppointmentCardInProgress',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Appointment Card In Progress',
                          builder: (context) =>
                              appointmentCardInProgressUseCase(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  folders: [],
                  isExpanded: true,
                ),
              ],
              isExpanded: true,
            ),
            WidgetbookFolder(
              name: 'features',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'client_visits',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'VisitsPieChart',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Visits pie chart',
                                  builder: (context) =>
                                      visitsPieChart2UseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Visits pie chart',
                                  builder: (context) =>
                                      visitsPieChartUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'ClientVisits',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'ClientVisits',
                                  builder: (context) =>
                                      clientVisitsUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'client_cancellation_rate',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'CancellationRate',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Client Cancellation Rate',
                                  builder: (context) =>
                                      cancellationRateUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'search_branches',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'BranchCard',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'BranchCard',
                                  builder: (context) =>
                                      branchCardUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'BranchList',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'BranchCard',
                                  builder: (context) =>
                                      branchListUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'SearchBranches',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'BranchCard',
                                  builder: (context) => searchUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'client_information',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'ClientInformationLoadingView',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Client Information Loading',
                                  builder: (context) =>
                                      clientInformationLoadingUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'ClientInformationLoadedView',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Client information loaded',
                                  builder: (context) =>
                                      clientInformationLoadedUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'client_appointments',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'DataCard',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Data Card positive',
                                  builder: (context) =>
                                      dataCardPositiveUseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Data Card negative',
                                  builder: (context) =>
                                      dataCardNegativeUseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Data Card zero',
                                  builder: (context) =>
                                      dataCardZeroUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'PetsCard',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Pets Card no item',
                                  builder: (context) =>
                                      petsCardUseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Pets Card 1 item',
                                  builder: (context) =>
                                      petsCardUseCaseOneItem(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Pets Card 2 item',
                                  builder: (context) =>
                                      petsCardUseCaseTwoItem(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Pets Card 10 item',
                                  builder: (context) =>
                                      petsCardUseCaseTenItem(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'DataCard2',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Data Card 2 positive',
                                  builder: (context) =>
                                      dataCard2PositiveUseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Data Card 2 negative',
                                  builder: (context) =>
                                      dataCard2NegativeUseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Data Card zero',
                                  builder: (context) =>
                                      dataCard2ZeroUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'PetItem',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'All pets 3 pets',
                                  builder: (context) => allPetsUseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'All pets 0 pets',
                                  builder: (context) =>
                                      allPetsUseCase0Pets(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'All pets 1 pet',
                                  builder: (context) =>
                                      allPetsUseCase1Pets(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'All pets 2 pets',
                                  builder: (context) =>
                                      allPetsUseCase2Pets(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'All pets 10 pets',
                                  builder: (context) =>
                                      allPetsUseCase10Pets(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'PetItem',
                                  builder: (context) => petItemUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'client_top_category',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'TopCategoryChart',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Top category pie chart',
                                  builder: (context) =>
                                      topCategoryUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'ClientTopCategory',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Top category pie chart',
                                  builder: (context) =>
                                      clientTopCategoryUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'view_logs',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'LogCard',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Log Card',
                                  builder: (context) => logCardUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'CardDescription',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Card Description',
                                  builder: (context) =>
                                      cardDescriptionUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'LogList',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Log List',
                                  builder: (context) => logListUseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Log List',
                                  builder: (context) => logTabsUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'modify_branch',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'BranchCardSettings',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'BranchCardSettings',
                                  builder: (context) =>
                                      branchCardSettingsUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                        WidgetbookFolder(
                          name: 'pages',
                          widgets: [
                            WidgetbookComponent(
                              name: 'ModifyBranch',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'ModifyBranch',
                                  builder: (context) =>
                                      modifyBranchUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'client_no_show_rate',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'NoShowRate',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Client No Show Rate',
                                  builder: (context) =>
                                      noShowRateUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'create_appointment',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'CreateAppointmentForm',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Create appointment form - Empty',
                                  builder: (context) =>
                                      createAppointmentFormUseCase(context),
                                ),
                                WidgetbookUseCase(
                                  name: 'Create appointment form - Filled',
                                  builder: (context) =>
                                      createAppointmentFormFilledUseCase(
                                          context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'appointment_schedule',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'widgets',
                          widgets: [
                            WidgetbookComponent(
                              name: 'AppointmentSchedule',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Appointment Schedule',
                                  builder: (context) =>
                                      appointmentScheduleUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'DailyCalendar',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Daily Calendar',
                                  builder: (context) =>
                                      dailyCalendarUseCase(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
              ],
              isExpanded: true,
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
