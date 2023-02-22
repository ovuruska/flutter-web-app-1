import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  //"Mon - 26 Feb 2023" | "4.00pm"
  var dateString = DateFormat("EEE - d MMM yyyy").format(date);
  return dateString;
}