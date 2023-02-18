import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_grid/box.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_grid/schedule.dart';

abstract class Callable {
  void call(DateTime time, bool newValue);
}

class OnTapCalled extends Mock implements Callable {}

void main() {
  var now = DateTime.now();
  var am_1 = DateTime(now.year, now.month, now.day, 8, 0, 0, 0, 0);
  var am_2 = DateTime(now.year, now.month, now.day, 9, 0, 0, 0, 0);
  var pm_1 = DateTime(now.year, now.month, now.day, 17, 0, 0, 0, 0);
  var pm_2 = DateTime(now.year, now.month, now.day, 18, 0, 0, 0, 0);
  var first_box = DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0);
  final mockOnTap = OnTapCalled();

  testWidgets("Weekly schedule tests", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Container(
        height: 640,
        width: 640,
        child: WeeklyScheduleGrid(
          onTap: mockOnTap,
          onLongPress:(a,b){},
          start: now,
          value: [am_1, am_2, pm_1, pm_2],
        ),
      ),
    ));

    expect(find.text('Mon'), findsOneWidget);
    expect(find.text('Tue'), findsOneWidget);
    expect(find.text('Wed'), findsOneWidget);
    expect(find.text('Thu'), findsOneWidget);
    expect(find.text('Fri'), findsOneWidget);
    expect(find.text('Sat'), findsOneWidget);
    expect(find.text('Sun'), findsOneWidget);
    await tester.tap(find.byType(WeeklyScheduleBox).first);
    verify(mockOnTap(first_box, true)).called(1);



  });
}
