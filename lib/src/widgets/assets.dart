import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppAsset extends StatelessWidget {
  const AppAsset({
    super.key,
    required this.iconName,
    this.width,
    this.height,
    this.size,
  })  : assert(
          !(width != null && size != null),
          'size and width cannot be provided together',
        ),
        assert(
          !(height != null && size != null),
          'size and height cannot be provided together',
        );

  final String iconName;
  final double? width;
  final double? height;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/$iconName',
      width: size ?? width,
      height: size ?? height,
    );
  }
}

class AppAssetSvg extends StatelessWidget {
  const AppAssetSvg({
    super.key,
    required this.iconName,
    this.color,
    this.width,
    this.height,
    this.size,
  })  : assert(
          !(width != null && size != null),
          'size and width cannot be provided together',
        ),
        assert(
          !(height != null && size != null),
          'size and height cannot be provided together',
        );

  final String iconName;
  final Color? color;
  final double? width;
  final double? height;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/$iconName',
      width: size ?? width,
      height: size ?? height,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
