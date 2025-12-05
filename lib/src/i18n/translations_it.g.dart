///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsIt implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsIt _root = this; // ignore: unused_field

	@override 
	TranslationsIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsValidatorsIt validators = _TranslationsValidatorsIt._(_root);
}

// Path: validators
class _TranslationsValidatorsIt implements TranslationsValidatorsEn {
	_TranslationsValidatorsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get invalidInput => 'Valore non valido';
	@override String get required => 'Questo campo è obbligatorio';
	@override String get wholeNumber => 'Deve essere un numero intero';
	@override String get decimalNumber => 'Deve essere un numero decimale';
	@override String get email => 'Indirizzo email non valido';
	@override String get url => 'URL non valido';
	@override String get date => 'La data non è valida';
}

/// The flat map containing all translations for locale <it>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsIt {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'validators.invalidInput': return 'Valore non valido';
			case 'validators.required': return 'Questo campo è obbligatorio';
			case 'validators.wholeNumber': return 'Deve essere un numero intero';
			case 'validators.decimalNumber': return 'Deve essere un numero decimale';
			case 'validators.email': return 'Indirizzo email non valido';
			case 'validators.url': return 'URL non valido';
			case 'validators.date': return 'La data non è valida';
			default: return null;
		}
	}
}

