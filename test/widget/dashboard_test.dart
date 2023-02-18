import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrubbers_employee_application/index.dart';
import '../screen.dart';

void main() {
  resolutions.forEach((element) {
    testWidgets("Dashboard view runs on ${element[0]} x ${element[1]} screen.", (tester) async {
      tester.binding.window.physicalSizeTestValue = Size(element[0].toDouble(), element[1].toDouble());
      await tester.pumpWidget(
          MaterialApp(home:DashboardView()));

      // resets the screen to its original size after the test end
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    });
  });



}