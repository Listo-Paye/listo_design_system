import 'package:flutter/material.dart';

enum ScreenType { desktop, tablet, handset, watch }

extension MaterialSizeRatio on Size {
  ScreenType get screenType {
    if (shortestSide > 900) return ScreenType.desktop;
    if (shortestSide > 600) return ScreenType.tablet;
    if (shortestSide > 300) return ScreenType.handset;
    return ScreenType.watch;
  }

  double get max => (height > width) ? height : width;
  double get min => (height > width) ? width : height;

  double get vmax => max / 100;
  double get vmin => min / 100;
  double get vwidth => width / 100;
  double get vheight => height / 100;
}
