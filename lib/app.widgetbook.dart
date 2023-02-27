// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:card_settings/card_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/app.dart';
import 'package:scrubbers_employee_application/features/modify_branch/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/features/modify_branch/domain/usecases/create_branch.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_state.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/widgets/branch_card_settings.dart';
import 'package:scrubbers_employee_application/features/modify_branch/register.dart';
import 'package:scrubbers_employee_application/features/modify_branch/widgetbook/branch_card_settings.dart';
import 'package:scrubbers_employee_application/features/modify_branch/widgetbook/modify_branch.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/widgets/branch_card.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/widgets/branch_list.dart';
import 'package:scrubbers_employee_application/features/search_branches/register.dart';
import 'package:scrubbers_employee_application/features/search_branches/widgetbook/branch_card.dart';
import 'package:scrubbers_employee_application/features/search_branches/widgetbook/branch_list.dart';
import 'package:scrubbers_employee_application/features/search_branches/widgetbook/search_branches.dart';
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
              name: 'features',
              widgets: [],
              folders: [
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
