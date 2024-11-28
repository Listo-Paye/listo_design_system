import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class CheckBoxWithText extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String text;

  const CheckBoxWithText({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  void _handleTap() {
    if (onChanged != null) {
      bool? newValue;
      if (value == null) {
        newValue = true;
      } else if (value == true) {
        newValue = false;
      } else {
        newValue = true;
      }
      onChanged!(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    if (value == null) {
      borderColor = SepteoColors.blue.shade700;
    } else if (value == true) {
      borderColor = SepteoColors.blue.shade900;
    } else {
      borderColor = SepteoColors.grey.shade200;
    }

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(SepteoSpacings.xxs),
        ),
        padding: const EdgeInsets.all(SepteoSpacings.xs),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CheckBox(
              value: value,
              onChanged: onChanged,
            ),
            const SizedBox(width: SepteoSpacings.xs),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                text,
                style: SepteoTextStyles.bodySmallInter,
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
