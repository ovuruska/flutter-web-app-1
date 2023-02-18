import 'package:rxdart/rxdart.dart';


class Bloc<T> {
  final BehaviorSubject<T> _subject = BehaviorSubject<T>();



  dispose() {
    _subject.close();
  }

  BehaviorSubject<T> get subject => _subject;
  T get value => _subject.value;
  Stream<T> get stream => _subject.stream;

}