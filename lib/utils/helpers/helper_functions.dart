import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UHelperFunctions {
  UHelperFunctions._();

  // Size, Height, and Width of the Screen
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // Dark Mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Given a string => Return a Color
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    }
    if (value == 'Red') {
      return Colors.red;
    }
    if (value == 'Blue') {
      return Colors.blue;
    }
    if (value == 'Pink') {
      return Colors.pink;
    }
    if (value == 'Yellow') {
      return Colors.yellow;
    }
    if (value == 'Black') {
      return Colors.black;
    }
    if (value == 'White') {
      return Colors.white;
    }
    if (value == 'Purple') {
      return Colors.purple;
    }
    if (value == 'Orange') {
      return Colors.orange;
    }
    if (value == 'Brown') {
      return Colors.brown;
    }
    if (value == 'Grey') {
      return Colors.grey;
    }
    if (value == 'Lime') {
      return Colors.lime;
    }
    if (value == 'Amber') {
      return Colors.amber;
    }

    return null;
  }

  // Detect a language of a given string
  static String detectLanguage(String text) {
    final RegExp persian = RegExp(r'^[\u0600-\u06FF]+');
    final RegExp english = RegExp(r'^[a-zA-Z]+');
    final RegExp arabic = RegExp(r'^[\u0621-\u064A]+');
    final RegExp chinese = RegExp(r'^[\u4E00-\u9FFF]+');
    final RegExp japanese = RegExp(r'^[\u3040-\u30FF]+');
    final RegExp korean = RegExp(r'^[\uAC00-\uD7AF]+');
    final RegExp russian = RegExp(r'^[\u0400-\u04FF]+');
    final RegExp italian = RegExp(r'^[\u00C0-\u017F]+');
    final RegExp french = RegExp(r'^[\u00C0-\u017F]+');
    final RegExp spanish = RegExp(
        r'[\u00C0-\u024F\u1E00-\u1EFF\u2C60-\u2C7F\uA720-\uA7FF\u1D00-\u1D7F]+');

    if (persian.hasMatch(text)) return 'fa';
    if (english.hasMatch(text)) return 'en';
    if (arabic.hasMatch(text)) return 'ar';
    if (chinese.hasMatch(text)) return 'zh';
    if (japanese.hasMatch(text)) return 'ja';
    if (korean.hasMatch(text)) return 'ko';
    if (russian.hasMatch(text)) return 'ru';
    if (italian.hasMatch(text)) return 'it';
    if (french.hasMatch(text)) return 'fr';
    if (spanish.hasMatch(text)) return 'es';

    return 'unknown'; // Default case
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyy'}) {
    return DateFormat(format).format(date);
  }
}
