import 'package:intl/intl.dart';

class UFormatterUtils {
  UFormatterUtils._();

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();

    return DateFormat('dd-mmm-yyyy')
        .format(date); // Customize the date format as needed
  }

  static String convertDateFormat(String inputDate) {
    // Parse the input date
    DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(inputDate);

    // Format the parsed date to the desired format
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);

    return formattedDate;
  }

  static String formatDateWord(String dateString) {
    // Create a map to convert month numbers to month names
    const monthNames = {
      '01': 'Jan',
      '02': 'Feb',
      '03': 'Mar',
      '04': 'Apr',
      '05': 'May',
      '06': 'Jun',
      '07': 'Jul',
      '08': 'Aug',
      '09': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
    };

    // Split the string by the '-' character
    List<String> parts = dateString.split('-');

    // Extract the day and month parts
    String day = parts[0];
    String month = parts[1];

    // Convert the month part to the month name using the map
    String monthName = monthNames[month] ?? 'Invalid month';

    // Return the formatted string
    return '$day $monthName';
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$')
        .format(amount); // customize the currency locale and symbol as needed
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }
}
