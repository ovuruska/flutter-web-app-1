import 'package:intl/intl.dart';

class StringUtils {
  static String capitalize(String s, {bool allWords = false}) {
    if (s.isEmpty) {
      return '';
    }
    s = s.trim();
    if (allWords) {
      var words = s.split(' ');
      var capitalized = [];
      for (var w in words) {
        capitalized.add(capitalize(w));
      }
      return capitalized.join(' ');
    } else {
      return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
    }
  }

  static String formatCurrency(double value) {
    return NumberFormat.simpleCurrency(locale: 'EN-us', decimalDigits: 2)
        .format(value);
  }

  static String formatDate(DateTime date) =>
      DateFormat("dd/MM/yyyy hh:mm a").format(date);

  static String getFormattedHour(int hour) {
    return DateFormat('hh a').format(DateTime(2021, 1, 1, hour));
  }

  static String prettifyList(List<String>? data) {
    if (data == null || data.length == 0) {
      return "N/A";
    } else if (data.length == 1) {
      return data[0];
    } else {
      return data.sublist(0, data.length - 1).join(", ") + " and " + data.last;
    }
  }


}
