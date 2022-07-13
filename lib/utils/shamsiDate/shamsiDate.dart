import 'package:shamsi_date/shamsi_date.dart';

Jalali nhDateToJalali({required String date}) {
  DateTime dateTime = DateTime.parse(date);
  return dateTime.toJalali();
}
