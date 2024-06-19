import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/themes/themes_module.dart';

enum TagColors {
  ghost(
    backgroundColor: Colors.white,
    textColor: ListoMainColors.neutral,
    indexTextColor: 700,
  ),
  base(
    backgroundColor: ListoMainColors.neutral,
    textColor: ListoMainColors.neutral,
    indexBackgroundColor: 100,
    indexTextColor: 700,
  ),
  danger(
    backgroundColor: ListoMainColors.error,
    textColor: ListoMainColors.error,
    indexBackgroundColor: 400,
    indexTextColor: 100,
  ),
  info(
    backgroundColor: ListoMainColors.info,
    textColor: ListoMainColors.info,
    indexBackgroundColor: 200,
    indexTextColor: 800,
  ),
  success(
    backgroundColor: ListoMainColors.success,
    textColor: ListoMainColors.success,
    indexBackgroundColor: 200,
    indexTextColor: 800,
  ),
  warning(
    backgroundColor: ListoMainColors.secondary,
    textColor: ListoMainColors.secondary,
    indexBackgroundColor: 200,
  );

  const TagColors({
    required Color backgroundColor,
    required Color textColor,
    int? indexBackgroundColor,
    int? indexTextColor,
  })  : _indexTextColor = indexTextColor,
        _indexBackgroundColor = indexBackgroundColor,
        _textColor = textColor,
        _backgroundColor = backgroundColor;

  final Color _backgroundColor;
  final Color _textColor;
  final int? _indexBackgroundColor;
  final int? _indexTextColor;

  Color _getColorValue(Color color, int? index) {
    if (index == null) {
      return color;
    }
    if (color is MaterialColor) {
      return color[index]!;
    }
    if (color is ListoColor) {
      return color.materialColor[index]!;
    }

    return color;
  }

  Color get backgroundColor =>
      _getColorValue(_backgroundColor, _indexBackgroundColor);

  Color get textColor => _getColorValue(_textColor, _indexTextColor);

  TagColors fromString(String value) {
    switch (value) {
      case 'Ghost':
        return TagColors.ghost;
      case 'Default':
        return TagColors.base;
      case 'Danger':
        return TagColors.danger;
      case 'Info':
        return TagColors.info;
      case 'Success':
        return TagColors.success;
      case 'Warning':
        return TagColors.warning;
      default:
        return TagColors.base;
    }
  }
}

class Tag extends StatelessWidget {
  final TagColors type;
  final String label;

  const Tag({super.key, required this.type, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Spacings.sm, vertical: Spacings.xs),
        decoration: BoxDecoration(
          color: type.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(Radiuses.md)),
        ),
        child: Text(label,
            style: TextStyles.labelLarge.copyWith(color: type.textColor, fontSize: 14)));
  }
}
