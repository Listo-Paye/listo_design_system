import 'package:flutter/material.dart';

extension SizeExtensions on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) => Padding(
        padding: padding,
        child: this,
      );
}
