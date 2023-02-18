import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/BoldText.dart';
import 'package:scrubbers_employee_application/widgets/InfoText.dart';

final boldText = (String text) => Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: BoldText(text: text),
    );

final infoText = (String text) => Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: InfoText(text: text),
      width:192,
    );
