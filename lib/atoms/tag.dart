import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum TagColors {
  ghost(
    backgroundColor: Colors.white,
    textColor: SepteoColors.grey,
    indexTextColor: 700,
  ),
  base(
    backgroundColor: SepteoColors.grey,
    textColor: SepteoColors.grey,
    indexBackgroundColor: 100,
    indexTextColor: 700,
  ),
  danger(
    backgroundColor: SepteoColors.red,
    textColor: SepteoColors.red,
    indexBackgroundColor: 400,
    indexTextColor: 100,
  ),
  info(
    backgroundColor: SepteoColors.blue,
    textColor: SepteoColors.blue,
    indexBackgroundColor: 200,
    indexTextColor: 800,
  ),
  success(
    backgroundColor: SepteoColors.green,
    textColor: SepteoColors.green,
    indexBackgroundColor: 200,
    indexTextColor: 800,
  ),
  warning(
    backgroundColor: SepteoColors.orange,
    textColor: SepteoColors.orange,
    indexBackgroundColor: 200,
  ),
  ;

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
            horizontal: SepteoSpacings.md, vertical: SepteoSpacings.xs),
        decoration: BoxDecoration(
          color: type.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(SepteoSpacings.xl)),
        ),
        child: Text(label,
            style: SepteoTextStyles.bodyMediumInter
                .copyWith(color: type.textColor, fontSize: 14)));
  }
}
