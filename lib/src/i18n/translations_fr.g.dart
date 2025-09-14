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
class TranslationsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsValidatorsFr validators = _TranslationsValidatorsFr._(_root);
}

// Path: validators
class _TranslationsValidatorsFr implements TranslationsValidatorsEn {
	_TranslationsValidatorsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalidInput => 'Valeur invalide';
	@override String get required => 'Ce champ est requis';
	@override String get wholeNumber => 'Doit être un nombre entier';
	@override String get decimalNumber => 'Doit être un nombre décimal';
	@override String get email => 'Adresse email invalide';
	@override String get url => 'URL invalide';
	@override String get date => 'La date est invalide';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'validators.invalidInput': return 'Valeur invalide';
			case 'validators.required': return 'Ce champ est requis';
			case 'validators.wholeNumber': return 'Doit être un nombre entier';
			case 'validators.decimalNumber': return 'Doit être un nombre décimal';
			case 'validators.email': return 'Adresse email invalide';
			case 'validators.url': return 'URL invalide';
			case 'validators.date': return 'La date est invalide';
			default: return null;
		}
	}
}

