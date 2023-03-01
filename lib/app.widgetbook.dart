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
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/app.dart';
import 'package:scrubbers_employee_application/features/create_new_appointment/presentation/widgets/customer_section.dart';
import 'package:scrubbers_employee_application/features/create_new_appointment/widgetbook/create_appointment_form.dart';
import 'package:scrubbers_employee_application/features/create_new_appointment/widgetbook/customer_section.dart';
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
          name: 'iPhone 12 Pro Max',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 926.0,
              width: 428.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'iPhone 12 Pro',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 844.0,
              width: 390.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'iPhone 12',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 844.0,
              width: 390.0,
            ),
            scaleFactor: 2.0,
          ),
          type: DeviceType.mobile,
        ),
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
                  ],
                  isExpanded: true,
                ),
              ],
              folders: [],
              isExpanded: true,
            ),
            WidgetbookFolder(
              name: 'features',
              widgets: [],
              folders: [
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
                  name: 'create_new_appointment',
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
                                  name: 'Create appointment form',
                                  builder: (context) =>
                                      createAppointmentFormUseCase(context),
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
