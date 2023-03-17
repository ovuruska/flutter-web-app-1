import '../injection.dart';


T? getItMaybe<T extends Object>() {
  try {
    return sl<T>();
  } catch (e) {
    return null;
  }
}