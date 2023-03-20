import 'package:flutter/cupertino.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../widgets/chip_text_field.dart';

@WidgetbookUseCase(name: 'Chip text field',type:ChipTextField)
Widget groomerSelectUseCase(BuildContext context){

  List<String> options = ['one','two','three'];

  return ChipTextField<String>(options: options,);
}