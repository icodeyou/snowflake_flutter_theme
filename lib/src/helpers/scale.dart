import 'dart:math';

import 'package:flutter/material.dart';

class Scale {
  static double value(
    BuildContext context, {
    double maxTextScaleFactor = 2,
  }) {
    final width = MediaQuery.of(context).size.width;
    final val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
