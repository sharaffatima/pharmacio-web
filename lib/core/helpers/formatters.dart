import 'package:intl/intl.dart';

class AppFormatters {
  static final _currencyFormat = NumberFormat.decimalPattern('en_US');

  static String formatCurrency(dynamic value) {
    if (value == null) return '-';
    
    if (value is String) {
      if (value.isEmpty) return '-';
      
      // Attempt to clean the string and parse it.
      // Often numbers come as strings like "1000.00" or "1,000.00"
      final cleanString = value.replaceAll(RegExp(r'[^0-9.]'), '');
      if (cleanString.isEmpty) return value;
      
      final numValue = double.tryParse(cleanString);
      if (numValue == null) return value;
      
      return _currencyFormat.format(numValue);
    }
    
    if (value is num) {
      return _currencyFormat.format(value);
    }
    
    return value.toString();
  }
}
