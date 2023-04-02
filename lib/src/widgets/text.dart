// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

import 'package:flutter/material.dart';

enum StyleEnum {
  bodyLarge,
  bodyMedium,
  bodySmall,
  titleLarge,
  titleMedium,
  titleSmall,
}

class AppText extends StatelessWidget {
  const AppText.bodyLarge(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  }) : enumStyle = StyleEnum.bodyLarge;

  const AppText.bodyMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  }) : enumStyle = StyleEnum.bodyMedium;

  const AppText.bodySmall(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  }) : enumStyle = StyleEnum.bodySmall;

  const AppText.titleLarge(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  }) : enumStyle = StyleEnum.titleLarge;

  const AppText.titleMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  }) : enumStyle = StyleEnum.titleMedium;

  const AppText.titleSmall(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  }) : enumStyle = StyleEnum.titleSmall;

  final String data;
  final TextAlign? textAlign;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;
  final StyleEnum enumStyle;

  static TextStyle? styleOf(BuildContext context, StyleEnum enumStyle) {
    final theme = Theme.of(context);

    // If widgets are wrap into DefaultTextStyle widget, make its style priority
    switch (enumStyle) {
      case StyleEnum.bodyLarge:
        return theme.textTheme.bodyLarge!
            .merge(DefaultTextStyle.of(context).style);
      case StyleEnum.bodyMedium:
        return theme.textTheme.bodyMedium!
            .merge(DefaultTextStyle.of(context).style);
      case StyleEnum.bodySmall:
        return theme.textTheme.bodySmall!
            .merge(DefaultTextStyle.of(context).style);
      case StyleEnum.titleLarge:
        return theme.textTheme.titleLarge!
            .merge(DefaultTextStyle.of(context).style);
      case StyleEnum.titleMedium:
        return theme.textTheme.titleMedium!
            .merge(DefaultTextStyle.of(context).style);
      case StyleEnum.titleSmall:
        return theme.textTheme.titleSmall!
            .merge(DefaultTextStyle.of(context).style);
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = styleOf(context, enumStyle);

    final overflow = (this.overflow == null && maxLines != null)
        ? TextOverflow.ellipsis
        : this.overflow;

    return Text(
      data,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      textHeightBehavior: const TextHeightBehavior(
        // To center text vertically when height is set
        leadingDistribution: TextLeadingDistribution.even,
      ),
      maxLines: maxLines,
      style: style!.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration,
      ),
    );
  }
}
