
import 'package:snowflake_flutter_theme/src/widgets/form/sanitization_extensions.dart';

class Sanitizer {
  /// Singleton constructor
  factory Sanitizer() => _instance;
  Sanitizer._internal();
  static final Sanitizer _instance = Sanitizer._internal();

  String Function(String input) _sanitizer = (input) {
    return input.trim();
  };

  List<String> _blacklist = [
    '<script',
    'script/>',
    '<!--',
    '-->',
    'javascript:',
    '<![CDATA',
    '<!DOCTYPE',
  ];

  // We want clear methods to change the rules, so we ignore the linter
  // ignore: use_setters_to_change_properties
  void overrideRules(String Function(String input) newRules) {
    _sanitizer = (input) => newRules(input);
  }

  void addRules(String Function(String input) newRules) {
    _sanitizer = (input) => _sanitizer(newRules(input));
  }

  // ignore: use_setters_to_change_properties
  void overrideBlacklist(List<String> newBlacklist) {
    _blacklist = newBlacklist;
  }

  void addBlacklist(List<String> newBlacklist) {
    _blacklist = [..._blacklist, ...newBlacklist];
  }

  /// Sanitize the input string
  String run(String input) {
    return _sanitizer(input).removeBlacklist(_blacklist);
  }
}
