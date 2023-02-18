import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';

abstract class Callable {
  void call(DateTime time, bool newValue);
}

class OnTapCalled extends Mock implements Callable {}

void main() {
  //
  var monday = DateTime(2023,1,30);
  var tuesday = DateTime(2023,1,31);

  test("Start of week is valid", () {
    expect(monday.weekday, 1);
    expect(tuesday.weekday, 2);
    var result = tuesday.startOfWeek();
    expect(result.weekday, 1);
    expect(result.day, monday.day);
    expect(result.month, monday.month);
    expect(result.year, monday.year);
  });

}
