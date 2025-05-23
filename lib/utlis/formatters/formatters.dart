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

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return '';
    if (phoneNumber.startsWith('0')) {
      return '+84${phoneNumber.substring(1)}';
    }
    return '+84$phoneNumber';
  }

}