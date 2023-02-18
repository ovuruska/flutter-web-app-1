import 'package:scrubbers_employee_application/common/Bloc.dart';

import 'model.dart';

class ListBloc<T> extends Bloc<ListModel<T>> {
  ListBloc(List<T>? items) {
    var model = ListModel<T>(items: items ?? []);
    subject.sink.add(model);
  }

  void update(T item) {
    subject.sink.add(subject.value.update(item));
  }

  void set(List<T> items) {
    subject.sink.add(subject.value.setItems(items));
  }

  void add(T item) {
    subject.sink.add(subject.value.addItem(item));
  }

  void remove(T item) {
    subject.sink.add(subject.value.removeItem(item));
  }

  void clear() {
    subject.sink.add(subject.value.clearItems());
  }
}
