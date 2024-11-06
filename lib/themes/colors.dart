import 'package:flutter/material.dart';

@Deprecated('Ce composant sera bientôt supprimé pour une refonte complète.')
abstract final class ListoMainColors {
  static const ListoColor primary = ListoColor(0xFF2E3862, {
    ListoSwatch.base: Color(0xFF2E3862),
    ListoSwatch.darker: Color(0xFF465BAF),
    ListoSwatch.dark: Color(0xFF506CC0),
    ListoSwatch.medium: Color(0xFF82A3D8),
    ListoSwatch.light: Color(0xFFCDDBF0),
    ListoSwatch.ultraLight: Color(0xFFF3F5FB),
  });

  static const ListoColor secondary = ListoColor(0xFFFF6136, {
    ListoSwatch.base: Color(0xFFFF6136),
    ListoSwatch.darker: Color(0xFFC61208),
    ListoSwatch.dark: Color(0xFFC61208),
    ListoSwatch.medium: Color(0xFFFF9871),
    ListoSwatch.light: Color(0xFFFFC2A8),
    ListoSwatch.ultraLight: Color(0xFFFFF3ED),
  });

  static const MaterialColor neutral = MaterialColor(0xFF17191A, {
    50: Color(0xFFF5F6F6),
    100: Color(0xFFE5E8E8),
    200: Color(0xFFCDD3D4),
    300: Color(0xFFAAB3B6),
    400: Color(0xFF808d90),
    500: Color(0xFF657275),
    600: Color(0xFF566064),
    700: Color(0xFF4A5254),
    800: Color(0xFF414749),
    900: Color(0xFF17191A),
  });

  static const ListoColor success = ListoColor(0xFF4ADE80, {
    ListoSwatch.darker: Color(0xFF15803C),
    ListoSwatch.dark: Color(0xFF22C55E),
    ListoSwatch.medium: Color(0xFF4ADE80),
    ListoSwatch.light: Color(0xFFDCFCE7),
    ListoSwatch.ultraLight: Color(0xFFF0FDF5),
  });

  static const ListoColor error = ListoColor(0xFFF87171, {
    ListoSwatch.darker: Color(0xFFB91C1C),
    ListoSwatch.dark: Color(0xFFEF4444),
    ListoSwatch.medium: Color(0xFFF87171),
    ListoSwatch.light: Color(0xFFFEE2E2),
    ListoSwatch.ultraLight: Color(0xFFFEF2F2),
  });

  static const ListoColor warning = ListoColor(0xFFFB8A3C, {
    ListoSwatch.darker: Color(0xFFC2570C),
    ListoSwatch.dark: Color(0xFFF97316),
    ListoSwatch.medium: Color(0xFFFB8A3C),
    ListoSwatch.light: Color(0xFFFECCAA),
    ListoSwatch.ultraLight: Color(0xFFFFF4ED),
  });

  static const ListoColor info = ListoColor(0xFF22D0EE, {
    ListoSwatch.darker: Color(0xFF0E7D90),
    ListoSwatch.dark: Color(0xFF06B6D4),
    ListoSwatch.medium: Color(0xFF22D0EE),
    ListoSwatch.light: Color(0xFFA5EFFC),
    ListoSwatch.ultraLight: Color(0xFFECFCFF),
  });
}

class ListoColor extends ColorSwatch<ListoSwatch> {
  const ListoColor(super.primary, super.swatch);

  bool _primaryLighterThan(ListoSwatch swatch) {
    if (this[ListoSwatch.base] == null) {
      return false;
    }
    return Color(value).computeLuminance() > this[swatch]!.computeLuminance();
  }

  bool _primaryDarkerThan(ListoSwatch swatch) {
    if (this[ListoSwatch.base] == null) {
      return false;
    }
    return Color(value).computeLuminance() < this[swatch]!.computeLuminance();
  }

  bool _primaryBetween(ListoSwatch darkerSwatch, ListoSwatch lighterSwatch) {
    if (this[ListoSwatch.base] == null) {
      return false;
    }
    return Color(value).computeLuminance() >
            this[darkerSwatch]!.computeLuminance() &&
        Color(value).computeLuminance() <
            this[lighterSwatch]!.computeLuminance();
  }

  Color get base => this[ListoSwatch.base]!;
  Color get darker => this[ListoSwatch.darker]!;
  Color get dark => this[ListoSwatch.dark]!;
  Color get medium => this[ListoSwatch.medium]!;
  Color get light => this[ListoSwatch.light]!;
  Color get ultraLight => this[ListoSwatch.ultraLight]!;

  MaterialColor get materialColor => MaterialColor(
        value,
        <int, Color>{
          50: _primaryLighterThan(ListoSwatch.ultraLight)
              ? Color(value)
              : this[ListoSwatch.ultraLight]!,
          100: _primaryBetween(ListoSwatch.light, ListoSwatch.ultraLight)
              ? Color(value)
              : this[ListoSwatch.ultraLight]!,
          200: this[ListoSwatch.light]!,
          300: _primaryBetween(ListoSwatch.medium, ListoSwatch.light)
              ? Color(value)
              : this[ListoSwatch.light]!,
          400: this[ListoSwatch.medium]!,
          500: _primaryBetween(ListoSwatch.dark, ListoSwatch.medium)
              ? Color(value)
              : this[ListoSwatch.medium]!,
          600: this[ListoSwatch.dark]!,
          700: _primaryBetween(ListoSwatch.darker, ListoSwatch.dark)
              ? Color(value)
              : this[ListoSwatch.dark]!,
          800: this[ListoSwatch.darker]!,
          900: _primaryDarkerThan(ListoSwatch.darker)
              ? Color(value)
              : this[ListoSwatch.darker]!,
        },
      );
}

@Deprecated('Ce composant sera bientôt supprimé pour une refonte complète.')
enum ListoSwatch {
  base,
  darker,
  dark,
  medium,
  light,
  ultraLight,
}
