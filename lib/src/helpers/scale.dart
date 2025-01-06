import 'dart:math';

import 'package:flutter/material.dart';

class Scale {
  static double value(
    BuildContext context, {
    double minTextScaleFactor = 0,
  }) {
    final width = MediaQuery.of(context).size.width;
    const nominalWidth = 430;
    final factor = width / nominalWidth;
    return max(minTextScaleFactor, factor);
  }
}
