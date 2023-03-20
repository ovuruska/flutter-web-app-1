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
import 'package:scrubbers_employee_application/features/analytics/client_cancellation_rate/widgetbook/cancellation_rate.dart';
import 'package:scrubbers_employee_application/features/analytics/client_no_show_rate/widgetbook/no_show_rate.dart';
import 'package:scrubbers_employee_application/features/analytics/client_top_category/presentation/widgetbook/client_top_category.dart';
import 'package:scrubbers_employee_application/features/analytics/client_top_category/presentation/widgetbook/top_category_chart.dart';
import 'package:scrubbers_employee_application/features/analytics/client_top_category/presentation/widgets/top_category_chart.dart';
import 'package:scrubbers_employee_application/features/analytics/client_visits/widgetbook/client_visits.dart';
import 'package:scrubbers_employee_application/features/analytics/client_visits/widgetbook/visits_pie_chart.dart';
import 'package:scrubbers_employee_application/features/analytics/client_visits/widgetbook/visits_pie_chart_2.dart';
import 'package:scrubbers_employee_application/features/forms/branch_modify/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/features/forms/branch_modify/domain/usecases/save_branch.dart';
import 'package:scrubbers_employee_application/features/forms/branch_modify/presentation/bloc/modify_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/branch_modify/presentation/bloc/modify_branch_event.dart';
import 'package:scrubbers_employee_application/features/forms/branch_modify/presentation/bloc/modify_branch_state.dart';
import 'package:scrubbers_employee_application/features/forms/branch_modify/presentation/widgets/branch_card_settings.dart';
import 'package:scrubbers_employee_application/features/forms/branch_modify/widgetbook/branch_card_settings.dart';
import 'package:scrubbers_employee_application/features/forms/branch_modify/widgetbook/modify_branch.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/domain/all_breeds.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/domain/entities/appointment_entity.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/presentation/widgets/appointment_section.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/presentation/widgets/branch_section.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/presentation/widgets/customer_section.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/widgetbook/appointment_section.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/widgetbook/branch_section.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/widgetbook/create_appointment_form.dart';
import 'package:scrubbers_employee_application/features/forms/create_appointment/widgetbook/customer_section.dart';
import 'package:scrubbers_employee_application/features/forms/groomer_select/presentation/widgetbook/groomer_select.dart';
import 'package:scrubbers_employee_application/features/information/client_information/domain/entities/client_information.dart';
import 'package:scrubbers_employee_application/features/information/client_information/widgetbook/client_information_loaded.dart';
import 'package:scrubbers_employee_application/features/information/client_information/widgetbook/client_information_loading.dart';
import 'package:scrubbers_employee_application/features/information/client_pets/domain/callbacks/select_pet_callback.dart';
import 'package:scrubbers_employee_application/features/information/client_pets/domain/entities/client_pet_item.dart';
import 'package:scrubbers_employee_application/features/information/client_pets/widgetbook/all_pets.dart';
import 'package:scrubbers_employee_application/features/information/client_pets/widgetbook/pet_item.dart';
import 'package:scrubbers_employee_application/features/information/transactions_grid/domain/entity/log_entity.dart';
import 'package:scrubbers_employee_application/features/information/transactions_grid/presentation/widgets/card_description.dart';
import 'package:scrubbers_employee_application/features/information/transactions_grid/presentation/widgets/log_card.dart';
import 'package:scrubbers_employee_application/features/information/transactions_grid/widgetbook/card_description.dart';
import 'package:scrubbers_employee_application/features/information/transactions_grid/widgetbook/log_card.dart';
import 'package:scrubbers_employee_application/features/information/transactions_grid/widgetbook/log_list.dart';
import 'package:scrubbers_employee_application/features/information/transactions_grid/widgetbook/log_tabs.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/bloc/search_branches_bloc.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/bloc/search_branches_event.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/widgets/branch_card.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/widgets/branch_list.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/widgetbook/branch_card.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/widgetbook/branch_list.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/widgetbook/search_branches.dart';
import 'package:scrubbers_employee_application/features/tables/client_appointments_table/presentation/widgetbook/data_card.dart';
import 'package:scrubbers_employee_application/features/tables/client_appointments_table/presentation/widgets/percent_indicator.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/injection.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:shimmer/shimmer.dart';
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
                ),
              ],
              folders: [],
            ),
            WidgetbookFolder(
              name: 'features',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'tables',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'client_appointments_table',
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
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'information',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'client_pets',
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
                                  name: 'PetItem',
                                  useCases: [
                                    WidgetbookUseCase(
                                      name: 'All pets 3 pets',
                                      builder: (context) =>
                                          allPetsUseCase(context),
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
                                      builder: (context) =>
                                          petItemUseCase(context),
                                    ),
                                  ],
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'transactions_grid',
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
                                      builder: (context) =>
                                          logCardUseCase(context),
                                    ),
                                  ],
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
                                ),
                                WidgetbookComponent(
                                  name: 'LogList',
                                  useCases: [
                                    WidgetbookUseCase(
                                      name: 'Log List',
                                      builder: (context) =>
                                          logListUseCase(context),
                                    ),
                                    WidgetbookUseCase(
                                      name: 'Log List',
                                      builder: (context) =>
                                          logTabsUseCase(context),
                                    ),
                                  ],
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
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
                                          clientInformationLoadingUseCase(
                                              context),
                                    ),
                                  ],
                                ),
                                WidgetbookComponent(
                                  name: 'ClientInformationLoadedView',
                                  useCases: [
                                    WidgetbookUseCase(
                                      name: 'Client information loaded',
                                      builder: (context) =>
                                          clientInformationLoadedUseCase(
                                              context),
                                    ),
                                  ],
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'sidebars',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'branch_search',
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
                                ),
                                WidgetbookComponent(
                                  name: 'SearchBranches',
                                  useCases: [
                                    WidgetbookUseCase(
                                      name: 'BranchCard',
                                      builder: (context) =>
                                          searchUseCase(context),
                                    ),
                                  ],
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'analytics',
                  widgets: [],
                  folders: [
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
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
                    ),
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
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
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
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
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
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'forms',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'groomer_select',
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
                                  name: 'ChipTextField<dynamic>',
                                  useCases: [
                                    WidgetbookUseCase(
                                      name: 'Chip text field',
                                      builder: (context) =>
                                          groomerSelectUseCase(context),
                                    ),
                                  ],
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
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
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'branch_modify',
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
                                ),
                              ],
                              folders: [],
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
                                ),
                              ],
                              folders: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
