import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;
import 'package:scrubbers_employee_application/features/client_information/presentation/widgets/client_information_loading.dart';

@WidgetbookUseCase(name: 'Client Information Loading',type:ClientInformationLoadingView)
Widget clientInformationLoadingUseCase(BuildContext context){
  return ClientInformationLoadingView();
}