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
class TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsValidatorsEs validators = _TranslationsValidatorsEs._(_root);
}

// Path: validators
class _TranslationsValidatorsEs implements TranslationsValidatorsEn {
	_TranslationsValidatorsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get invalidInput => 'Entrada inválida';
	@override String get required => 'Este campo es obligatorio';
	@override String get wholeNumber => 'Debe ser un número entero';
	@override String get decimalNumber => 'Debe ser un número decimal';
	@override String get email => 'Dirección de correo electrónico inválida';
	@override String get url => 'URL inválida';
	@override String get date => 'La fecha es inválida';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'validators.invalidInput': return 'Entrada inválida';
			case 'validators.required': return 'Este campo es obligatorio';
			case 'validators.wholeNumber': return 'Debe ser un número entero';
			case 'validators.decimalNumber': return 'Debe ser un número decimal';
			case 'validators.email': return 'Dirección de correo electrónico inválida';
			case 'validators.url': return 'URL inválida';
			case 'validators.date': return 'La fecha es inválida';
			default: return null;
		}
	}
}

