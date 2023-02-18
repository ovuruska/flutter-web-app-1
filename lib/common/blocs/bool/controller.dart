import 'package:scrubbers_employee_application/common/Bloc.dart';

class BoolController extends Bloc<bool> {
  BoolController(bool? value) {
    subject.sink.add(value ?? true);
  }

  toggle() {
    subject.sink.add(!subject.value);
  }

  setValue(bool newValue) {
    subject.sink.add(newValue);
  }
}
