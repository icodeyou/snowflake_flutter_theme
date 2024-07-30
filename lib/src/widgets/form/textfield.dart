
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';
import 'package:snowflake_flutter_theme/src/i18n/translations.g.dart';
import 'package:snowflake_flutter_theme/src/widgets/form/sanitizater.dart';
import 'package:snowflake_flutter_theme/src/widgets/form/smart_controller.dart';
import 'package:string_validator/string_validator.dart';

enum SmartFieldType {
  raw,
  wholeNumber,
  decimalNumber,
  email,
  url,
  date,
}

const String undefinedSmartFieldKey = 'UNDEFINED';

class AppTextField extends FormBuilderField<String> {
  AppTextField({
    this.type = SmartFieldType.raw,
    GlobalKey<AppTextFieldState>? smartKey,
    SmartController? smartController,
    bool required = false,
    String name = undefinedSmartFieldKey,
    InputDecoration? decoration,
    String? label,
    String? hint,
    bool validateOnChanged = false,
    String? Function(String text)? validator,
    void Function(String text)? onChanged,
  }) : super(
          key: smartKey,
          name: name,
          validator: (value) {
            // Required check
            if (value == null || value.isEmpty) {
              if (required) {
                return t.validators.required;
              } else {
                return null;
              }
            }

            // Type check
            String? typeCheck;
            switch (type) {
              case SmartFieldType.raw:
                break;
              case SmartFieldType.email:
                typeCheck = isEmail(value) ? null : t.validators.email;
              case SmartFieldType.wholeNumber:
                typeCheck = isNumeric(value) && isInt(value)
                    ? null
                    : t.validators.wholeNumber;
              case SmartFieldType.decimalNumber:
                typeCheck = isNumeric(value) && isFloat(value)
                    ? null
                    : t.validators.decimalNumber;
              case SmartFieldType.url:
                typeCheck = isURL(value) ? null : t.validators.url;
              case SmartFieldType.date:
                typeCheck = isDate(value) ? null : t.validators.date;
            }

            // Return validator
            return typeCheck ?? validator?.call(value);
          },
          builder: (field) {
            return FormBuilderTextField(
              controller: smartController,
              name: name,
              inputFormatters: _getInputFormatters(type),
              decoration: (decoration ??
                      InputDecoration(
                        contentPadding: ThemeSizes.m.asInsets.horizontalOnly,
                        border: const OutlineInputBorder(),
                      ))
                  .copyWith(
                labelText: label,
                hintText: hint,
                hintStyle: const TextStyle(color: ThemeColors.grey30),
                errorText: field.errorText,
              ),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                final sanitizedValue = Sanitizer().run(value);
                onChanged?.call(sanitizedValue);
                smartController?.text = sanitizedValue;
                if (validateOnChanged) {
                  field.validate();
                }
                field.didChange(value);
              },
            );
          },
        );

  @override
  AppTextFieldState createState() => AppTextFieldState();

  final SmartFieldType type;

  static List<TextInputFormatter> _getInputFormatters(SmartFieldType type) {
    return switch (type) {
      SmartFieldType.wholeNumber => [FilteringTextInputFormatter.digitsOnly],
      SmartFieldType.decimalNumber => [
          FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
        ],
      SmartFieldType.date => [
          FilteringTextInputFormatter.allow(RegExp('[0-9/]')),
        ],
      SmartFieldType.email => [],
      SmartFieldType.url => [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9:/._-]')),
        ],
      SmartFieldType.raw => [],
    };
  }
}

class AppTextFieldState
    extends FormBuilderFieldState<FormBuilderField<String>, String> {
  @override
  String get value {
    final value = super.value;
    if (value == null) {
      return '';
    }
    return Sanitizer().run(
      value,
    );
  }
}
