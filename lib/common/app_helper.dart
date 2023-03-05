import 'package:intl/intl.dart';

class AppHelper {
  static bool isNotEmpty(String? string) {
    return string != null && string.isNotEmpty;
  }

  static String dateFormatDDMMYYYY(String? date) {
    return DateFormat('dd MMM yyyy')
        .format(DateTime.parse(date ?? "${DateTime.now()}"));
  }
}
