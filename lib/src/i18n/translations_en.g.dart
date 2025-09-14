///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsValidatorsEn validators = TranslationsValidatorsEn._(_root);
}

// Path: validators
class TranslationsValidatorsEn {
	TranslationsValidatorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get invalidInput => 'Invalid value';
	String get required => 'This field is required';
	String get wholeNumber => 'Must be a whole number';
	String get decimalNumber => 'Must be a decimal number';
	String get email => 'Invalid email address';
	String get url => 'Invalid URL';
	String get date => 'The date is invalid';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'validators.invalidInput': return 'Invalid value';
			case 'validators.required': return 'This field is required';
			case 'validators.wholeNumber': return 'Must be a whole number';
			case 'validators.decimalNumber': return 'Must be a decimal number';
			case 'validators.email': return 'Invalid email address';
			case 'validators.url': return 'Invalid URL';
			case 'validators.date': return 'The date is invalid';
			default: return null;
		}
	}
}

