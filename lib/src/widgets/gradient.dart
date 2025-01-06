import 'package:flutter/material.dart';

class GradientView extends StatelessWidget {
  const GradientView({
    super.key,
    required this.topColor,
    required this.bottomColor,
    this.height,
  });

  final Color topColor;
  final Color bottomColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            topColor,
            bottomColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
