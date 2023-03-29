import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class DatePicker {
  static show(context, {int? firstDate, DateTime? selectedDay}) async {
    return await showDatePicker(
      context: context,
      initialDate: selectedDay ?? DateTime.now(),
      firstDate: DateTime(firstDate ?? 2015),
      lastDate: DateTime(2100),
      confirmText: 'Confirm',
      cancelText: 'Cancel',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            shadowColor: UIColor.white,
            colorScheme: const ColorScheme.light(
              primary: UIColor.ultramarineBlue,
              onPrimary: UIColor.white,
              surface: UIColor.pastelRed,
              onSurface: UIColor.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: UIColor.black,
              ),
            ),
          ),
          child: Container(
            child: child,
          ),
        );
      },
    );
  }
}
