import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // Format Currency with VND
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return '';
    // Remove any existing +84 or 0 prefix
    String cleanNumber = phoneNumber.replaceAll(RegExp(r'^(\+84|0)'), '');
    // Add +84 prefix
    return '+84$cleanNumber';
  }
}
