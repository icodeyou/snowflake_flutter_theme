import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// `AppGap` is a box that can be used to add a space in Row or Column
/// If it is a row, the box will have a width of $gap
/// /// If it is a column, the box will have a height of $gap
class AppGap extends StatelessWidget {
  /// Constructor
  /// parameter : double gap
  const AppGap(this.gap, {super.key});

  /// xxs size : '4'
  const AppGap.xxs({
    super.key,
  }) : gap = ThemeSizes.xxs;

  /// xs size : '8'
  const AppGap.xs({
    super.key,
  }) : gap = ThemeSizes.xs;

  /// s size : '12'
  const AppGap.s({
    super.key,
  }) : gap = ThemeSizes.s;

  /// m size : '16'
  const AppGap.m({
    super.key,
  }) : gap = ThemeSizes.m;

  /// l size : '20'
  const AppGap.l({
    super.key,
  }) : gap = ThemeSizes.l;

  /// xl size : '24'
  const AppGap.xl({
    super.key,
  }) : gap = ThemeSizes.xl;

  /// xxl size : '32'
  const AppGap.xxl({
    super.key,
  }) : gap = ThemeSizes.xxl;

  /// xxxl size : '40'
  const AppGap.xxxl({
    super.key,
  }) : gap = ThemeSizes.xxxl;

  /// Value of the gap
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Gap(gap);
  }
}
