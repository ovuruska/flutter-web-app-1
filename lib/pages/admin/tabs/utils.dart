import 'package:intl/intl.dart';

DateTime dateFromIndex(int index,{
  DateTime? start,
}) {
  var now = start ?? DateTime.now();
  var day = now.day + (index / 24).toInt() ;
  var hour = index % 24;
  var out = DateTime(now.year, now.month, day, hour,0,0,0,0);

  return out;
}

final dayFormatter = DateFormat('EEEE');
