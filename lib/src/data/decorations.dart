import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/src/data/colors.dart';
import 'package:snowflake_flutter_theme/src/data/radius.dart';

/// All decorations are defined in this class
class ThemeDecorations {
  /// Create an elevated box with a light background, rounded borders
  static final BoxDecoration lightCard = BoxDecoration(
    color: Colors.white,
    borderRadius: ThemeRadius.m.asBorderRadius,
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: ThemeColors.darkGrey.withOpacity(0.5),
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );

  static final BoxDecoration greyBox = BoxDecoration(
    color: Colors.white,
    borderRadius: ThemeRadius.m.asBorderRadius,
  );
}
