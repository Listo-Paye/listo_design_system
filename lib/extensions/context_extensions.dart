import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get mediaSize => MediaQuery.sizeOf(this);
  Orientation get orientation => MediaQuery.orientationOf(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}
