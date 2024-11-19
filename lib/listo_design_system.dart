library;

import 'package:flutter/material.dart';

import 'themes/main_theme.dart';

export 'atoms/atoms_module.dart';
export 'charts/charts_module.dart';
export 'extensions/extensions_module.dart';
export 'molecules/molecules_module.dart';
export 'svg/svg_module.dart';
export 'themes/themes_module.dart';

class ListoDesignSystem {
  static Themes themes = Themes();
}

class Themes {
  final ThemeData main = mainTheme;
}
