import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/src/data/font_sizes.dart';

/// This class defines all kinds of [Text]
class AppText extends StatelessWidget {
  ///
  /// The default constructor.
  /// It must override [fontSize]
  ///
  const AppText(
    this.text, {
    super.key,
    required this.fontSize,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.textScalerValue,
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        );

  ///
  /// The constructor XXS
  /// It gives a XXS value for the parameter [fontSize]
  /// [fontSize] cannot be overridden
  ///
  const AppText.xxs(
    this.text, {
    super.key,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.textScalerValue,
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = ThemeFontSizes.xxs;

  /// The constructor XS
  /// It gives an XS value for the parameter [fontSize]
  /// [fontSize] cannot be overridden
  const AppText.xs(
    this.text, {
    super.key,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.textScalerValue,
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = ThemeFontSizes.xs;

  /// The constructor S
  /// It gives an S value for the parameter [fontSize]
  /// [fontSize] cannot be overridden
  const AppText.s(
    this.text, {
    super.key,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.textScalerValue,
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = ThemeFontSizes.s;

  /// The constructor M
  /// It gives an M value for the parameter [fontSize]
  /// [fontSize] cannot be overridden
  const AppText.m(
    this.text, {
    super.key,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.textScalerValue,
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = ThemeFontSizes.m;

  /// The constructor L
  /// It gives an L value for the parameter [fontSize]
  /// [fontSize] cannot be overridden
  const AppText.l(
    this.text, {
    super.key,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.textScalerValue,
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = ThemeFontSizes.l;

  /// The constructor XL
  /// It gives an XL value for the parameter [fontSize]
  /// [fontSize] cannot be overridden
  const AppText.xl(
    this.text, {
    super.key,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.textScalerValue,
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = ThemeFontSizes.xl;

  /// The constructor XXL
  /// It gives an XXL value for the parameter [fontSize]
  /// [fontSize] cannot be overridden
  const AppText.xxl(
    this.text, {
    super.key,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.textScalerValue,
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = ThemeFontSizes.xxl;

  /// Text to display in the widget
  final String text;

  /// Size of the font, generally overridden by the constructor
  final double fontSize;

  /// Boolean value indicating if text should be bold
  /// It cannot be used simultaneously with [fontSize]
  final bool bold;

  /// Boolean value indicating if text should be italic
  /// It cannot be used simultaneously with [fontStyle]
  final bool italic;

  /// Whether and how to align text horizontally.
  final TextAlign? textAlign;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How overflowing text should be handled.
  final TextOverflow? overflow;

  /// Maximum number of lines
  final int? maxLines;

  /// The color of the text
  final Color? color;

  /// The thickness of the glyphs used to draw the text
  final FontWeight? fontWeight;

  /// Whether to slant the glyphs in the font
  final FontStyle? fontStyle;

  /// A linear decoration to draw near the text.
  final TextDecoration? textDecoration;

  /// A scaler to scale the text according to the screen size
  final double? textScalerValue;

  @override
  Widget build(BuildContext context) {
    final overflow = (this.overflow == null && maxLines != null)
        ? TextOverflow.ellipsis
        : this.overflow;

    return Text(
      text,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      textHeightBehavior: const TextHeightBehavior(
        // To center text vertically when height is set
        leadingDistribution: TextLeadingDistribution.even,
      ),
      maxLines: maxLines,
      textScaler:
          textScalerValue == null ? null : TextScaler.linear(textScalerValue!),
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.bold : fontWeight,
        fontStyle: italic ? FontStyle.italic : fontStyle,
        decoration: textDecoration,
      ),
    );
  }
}
