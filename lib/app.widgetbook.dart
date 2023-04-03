// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:scrubbers_employee_application/app.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';
import 'package:scrubbers_employee_application/features/analytics/client_cancellation_rate/widgetbook/cancellation_rate.dart';
import 'package:scrubbers_employee_application/features/analytics/client_no_show_rate/widgetbook/no_show_rate.dart';
import 'package:scrubbers_employee_application/features/analytics/client_top_category/presentation/widgetbook/client_top_category.dart';
import 'package:scrubbers_employee_application/features/analytics/client_top_category/presentation/widgetbook/top_category_chart.dart';
import 'package:scrubbers_employee_application/features/analytics/client_top_category/presentation/widgets/top_category_chart.dart';
import 'package:scrubbers_employee_application/features/analytics/client_visits/widgetbook/client_visits.dart';
import 'package:scrubbers_employee_application/features/analytics/client_visits/widgetbook/visits_pie_chart.dart';
import 'package:scrubbers_employee_application/features/analytics/client_visits/widgetbook/visits_pie_chart_2.dart';
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
import 'package:scrubbers_employee_application/features/tables/client_appointments_table/presentation/widgetbook/data_card.dart';
import 'package:scrubbers_employee_application/features/tables/client_appointments_table/presentation/widgets/percent_indicator.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/injection.dart';
import 'package:scrubbers_employee_application/widgets/branch_slot/widgetbook.dart';
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
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'branch_slot',
                  widgets: [
                    WidgetbookComponent(
                      name: 'BranchSlot',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Daily Slot - Morning and Afternoon Full',
                          builder: (context) => branchSlotBothFull(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Daily Slot - Afternoon Full',
                          builder: (context) =>
                              branchSlotAfternoonFull(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Daily Slot - Morning Full',
                          builder: (context) => branchSlotMorningFull(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Daily Slot - Morning and Afternoon Empty',
                          builder: (context) => branchSlotBothEmpty(context),
                        ),
                      ],
                    ),
                  ],
                  folders: [],
                ),
              ],
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
              ],
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
