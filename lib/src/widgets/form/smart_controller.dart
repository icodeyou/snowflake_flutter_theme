import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/src/widgets/form/sanitizater.dart';

class SmartController extends TextEditingController {
  SmartController({
    super.text,
    this.trim = true,
  });

  /// This variable is default to true, but 
  /// it can be changed in the TextField widget.
  bool trim;

  String get data {
    final sanitizedText = Sanitizer().run(super.text);
    if (trim) {
      return sanitizedText.trim();
    }
    return sanitizedText;
  }
}
