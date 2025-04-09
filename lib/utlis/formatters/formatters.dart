import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // Format Currency with VND
  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(amount);
  }

}