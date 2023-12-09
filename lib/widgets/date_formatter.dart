import 'package:flutter/material.dart';

class DateFormatter {
  // Widget Formato Calendar;
  static String formatDate(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    // return "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";
  }

  static DateTime parseDate(String formattedDate) {
    List<String> parts = formattedDate.split('-');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);
    return DateTime(day, month, year);
  }

  static Future<DateTime?> selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
  }

  static void handleDateController(
    TextEditingController dateController,
    BuildContext context,
    Function(DateTime)? onDateSelected,
  ) {
    dateController.addListener(() {
      final text = dateController.text;
      if (text.isNotEmpty) {
        final parsedDate = parseDate(text);
        if (_isUnderage(parsedDate)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('La fecha de nacimiento indica que es menor de edad.'),
            ),
          );
        }
        if (onDateSelected != null) {
          onDateSelected(parsedDate);
        }
      }
    });
  }

  static bool _isUnderage(DateTime date) {
    final currentDate = DateTime.now();
    final age = currentDate.year -
        date.year -
        (currentDate.month > date.month ||
                (currentDate.month == date.month && currentDate.day >= date.day)
            ? 0
            : 1);
    return age < 18;
  }
}
