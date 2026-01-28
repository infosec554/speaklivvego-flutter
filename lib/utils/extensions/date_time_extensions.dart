import 'package:speak_live_go/utils/extensions/int_extensions.dart';

extension DateTimeExtensions on DateTime {
  String get getHHmm {
    return '${hour.zerolize}:${minute.zerolize}';
  }

  String get getMonthNameDayHHmm {
    final monthName = _monthNames[month - 1];
    final dayString = day.zerolize;
    final hh = hour.zerolize;
    final mm = minute.zerolize;
    return '$monthName $dayString $hh:$mm';
  }

  static const List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
}
