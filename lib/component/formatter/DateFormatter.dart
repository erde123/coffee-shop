import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  var locale = 'id_ID';
  initializeDateFormatting(locale); // Initialize locale data
  
  final dayName = DateFormat('EEEE', locale).format(dateTime);
  final day = DateFormat('d', locale).format(dateTime);
  final monthName = DateFormat('MMM', locale).format(dateTime);
  final year = DateFormat('yyyy').format(dateTime);
  final hourMinute = DateFormat('HH:mm').format(dateTime);

  return '$dayName, $day $monthName $year $hourMinute';
}
