import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppAsset extends StatelessWidget {
  const AppAsset({
    super.key,
    required this.iconName,
    this.width,
    this.height,
  });

  final String iconName;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/$iconName',
      width: width,
      height: width,
    );
  }
}

class AppAssetSvg extends StatelessWidget {
  const AppAssetSvg({
    super.key,
    required this.iconName,
    this.width,
    this.height,
    this.color,
  });

  final String iconName;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/$iconName',
      width: width,
      height: height,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
