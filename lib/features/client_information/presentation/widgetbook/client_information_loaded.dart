import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../../domain/entities/client_information.dart';
import '../widgets/client_information_loaded.dart';


@WidgetbookUseCase(name:"Client information loaded",type:ClientInformationLoadedView)
Widget clientInformationLoadedUseCase(BuildContext context){

  var clientInformation = ClientInformation(
    id: 1,
    name: "John Doe",
    email: "personal@gmail.com",
    phoneNumber: "1234567890",
  );
  return Container(
    color:Colors.white,
    height:360,
      width:240,
      child:ClientInformationLoadedView(client: clientInformation)
  );
}