import 'package:intl/intl.dart';

class CurrencyHelper {
  static String idr(double number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rs. ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(number);
  }
}