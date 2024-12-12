import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/src/widgets/form/sanitizater.dart';

class SmartController extends TextEditingController {
  SmartController({
    super.text,
    this.validator, // TODO(jeanvallon): Delete validator
  });

  final bool Function(String)? validator; // TODO(jeanvallon): Delete validator

  @override
  String get text => Sanitizer().run(super.text);
}
