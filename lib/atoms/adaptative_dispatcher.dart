import 'package:flutter/material.dart';

import '../extensions/extensions_module.dart';

class AdaptiveDispatcher extends StatelessWidget {
  final Widget? desktop;
  final Widget? tablet;
  final Widget handset;
  final Widget? watch;

  const AdaptiveDispatcher({
    super.key,
    this.desktop,
    this.tablet,
    required this.handset,
    this.watch,
  });

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = context.mediaSize.screenType;

    switch (screenType) {
      case ScreenType.desktop:
        return desktop ?? tablet ?? handset;
      case ScreenType.tablet:
        return tablet ?? desktop ?? handset;
      case ScreenType.watch:
        return watch ?? handset;
      default:
        return handset;
    }
  }
}
