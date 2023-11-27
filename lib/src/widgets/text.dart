import 'package:flutter/material.dart';

/// This class defines all kinds of [Text] sizes
class AppFontSizes {
  /// Font size XXS
  static const double xxs = 10;

  /// Font size XS
  static const double xs = 12;

  /// Font size S
  static const double s = 15;

  /// Font size M
  static const double m = 18;

  /// Font size L
  static const double l = 22;

  /// Font size XL
  static const double xl = 27;

  /// Font size XXL
  static const double xxl = 32;
}

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
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = AppFontSizes.xxs;

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
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = AppFontSizes.xs;

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
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = AppFontSizes.s;

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
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = AppFontSizes.m;

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
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = AppFontSizes.l;

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
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = AppFontSizes.xl;

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
  })  : assert(
          !bold || fontWeight == null,
          'If bold is set to true, fontWeight must be null',
        ),
        assert(
          !italic || fontStyle == null,
          'If italic is set to true, fontStyle must be null',
        ),
        fontSize = AppFontSizes.xxl;

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
