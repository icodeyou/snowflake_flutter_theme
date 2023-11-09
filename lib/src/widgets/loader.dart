// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

@visibleForTesting
enum AppLoaderSize {
  small,
  regular,
  big,
}

class AppLoader extends StatelessWidget {
  const AppLoader.small({
    super.key,
    this.color,
  }) : size = AppLoaderSize.small;

  const AppLoader.regular({
    super.key,
    this.color,
  }) : size = AppLoaderSize.regular;

  const AppLoader.big({
    super.key,
    this.color,
  }) : size = AppLoaderSize.big;

  final AppLoaderSize size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? ThemeColors.secondary(context);

    final dimension = () {
      switch (size) {
        case AppLoaderSize.small:
          return ThemeSizes.s;
        case AppLoaderSize.regular:
          return ThemeSizes.xl;
        case AppLoaderSize.big:
          return ThemeSizes.xxxl;
      }
    }();

    return SizedBox(
      height: dimension,
      width: 2 * dimension,
      child: SpinKitRing(
        color: color,
        lineWidth: 2,
        size: dimension,
      ),
    );
  }
}
