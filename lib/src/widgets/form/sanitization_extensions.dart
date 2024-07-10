import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/src/widgets/form/textfield.dart';

/// Extension on [String] to make it cleaner and safer.
extension SanitizationExtensions on String {
  /// Removes all blacklisted characters from the string.
  String removeBlacklist(List<String> blacklist) {
    final pattern = blacklist
        .map(RegExp.escape) // Escape special regex characters
        .join('|');

    final regex = RegExp(pattern, caseSensitive: false);

    return replaceAll(regex, '');
  }
}

extension SmartTextFieldKeyExtensions on GlobalKey<AppTextFieldState> {
  String get stringValue {
    if (currentState == null) {
      throw Exception(
        'Trying to access the value of a textfield that has been disposed',
      );
    }
    return currentState!.value;
  }
}
