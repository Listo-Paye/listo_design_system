library;

import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';


export 'atoms/atoms_module.dart';
export 'charts/charts_module.dart';
export 'extensions/extensions_module.dart';
export 'molecules/molecules_module.dart';
export 'svg/svg_module.dart';
export 'package:septeo_design_system/septeo_design_system.dart';

class ListoDesignSystem {
  static Themes themes = Themes();
}

class Themes {
  final ThemeData main = mainTheme;
}
