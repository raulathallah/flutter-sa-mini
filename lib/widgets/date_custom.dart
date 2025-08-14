import 'package:intl/intl.dart';

String toDateString(String date) {
  return DateFormat(
    'd MMMM, yyyy',
  ).format(DateFormat('yyyy-MM-dd').parse(date));
}
